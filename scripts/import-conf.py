#!/usr/bin/env python3
"""Import the TLA+ conference site (github.com/tlaplus/conf) into content/events and static/events.

Usage: scripts/import-conf.py [path/to/conf/checkout]

Without a path, it fetches the pinned commit into a temporary directory.
Rerunning rewrites page bodies and files, and keeps the front matter of pages that already exist.
"""
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

REPO = "https://github.com/tlaplus/conf.git"
COMMIT = "a94cc06f63b3e245c50a35248bfbcca0deb226f5"
ROOT = Path(__file__).resolve().parent.parent
CONTENT = ROOT / "content/events"
STATIC = ROOT / "static/events"

# This site replaces these pages, so links to them point here instead.
REPLACED = {
    "https://lamport.azurewebsites.net/tla/tla.html": "/",
    "http://lamport.azurewebsites.net/tla/tla.html": "/",
    "https://lamport.azurewebsites.net/tla/tools.html": "/tools/",
}

# talk.tlapl.us no longer resolves, so the notice that points to it is dropped.
STALE = re.compile(r"\{\{% notice note %\}\}[^{]*talk\.tlapl\.us.*?\{\{% /notice %\}\}\n?", re.S)


def fetch(dest):
    git = ["git", "-C", str(dest)]
    subprocess.run(["git", "clone", "-q", "--filter=blob:none", "--no-checkout", REPO, str(dest)], check=True)
    subprocess.run(git + ["sparse-checkout", "set", "--no-cone", "/content/", "/static/"], check=True)
    subprocess.run(git + ["checkout", "-q", COMMIT], check=True)


def split(text):
    m = re.match(r"\+\+\+\n(.*?)\n\+\+\+\n", text, re.S)
    return (m.group(1), text[m.end():]) if m else ("", text)


def toml_value(front, key):
    m = re.search(rf'^{key}\s*=\s*"?(.*?)"?\s*$', front, re.M)
    return m.group(1) if m else None


def quote(s):
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def take_title(body):
    """Return a talk page's heading and the body without it."""
    m = re.match(r"\s*### (.+)\n", body) or re.match(r"\s*## Title\s*\n\s*\n(.+)\n", body)
    return (m.group(1).strip(), body[m.end():]) if m else (None, body)


def rewrite(body, event, ids, pages):
    alt = "|".join(sorted(map(re.escape, ids), key=len, reverse=True))
    body = STALE.sub("", body)
    body = re.sub(r'(\]\(|href=")/(' + alt + r")/", r"\1/events/\2/", body)
    body = re.sub(r'(\]\(|href=")/([^/)"\s]*TLAConf19[^/)"\s]*)', r"\1/events/2019/\2", body)
    body = re.sub(r"\]\((?![a-z]+:|/|#|\{)([^)\s]+)\)", rf"](/events/{event}/\1)", body)

    def ref(m):
        target = pages[m.group(1).lower()]
        return '{{< relref "/events/%s/%s" >}}' % target

    body = re.sub(r'\{\{< ref "/([^"]+)" >\}\}', ref, body)
    body = body.replace("{{% notice note %}}", '{{% notice style="note" %}}')
    for old, new in REPLACED.items():
        body = body.replace(f"]({old})", f"]({new})")
    return body


def write(path, front, body):
    if path.exists():
        front = split(path.read_text())[0]
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(f"+++\n{front}\n+++\n\n{body.strip()}\n")


def main(src):
    events = sorted(p.name for p in (src / "content").iterdir() if p.is_dir() and p.name != "home")
    pages = {f.name.lower(): (f.parent.name, f.name) for e in events for f in (src / "content" / e).glob("*.md")}

    for event in events:
        for f in sorted((src / "content" / event).glob("*.md")):
            front, body = split(f.read_text())
            body = rewrite(body, event, events, pages)
            if f.name == "_index.md":
                body = re.sub(r'\A\s*<div align="right">.*?</div>\s*', "", body, flags=re.S)
                body = re.sub(r"\A\s*# .*\n", "", body)
                meta = [f"title = {quote(toml_value(front, 'title'))}", f"weight = {toml_value(front, 'weight')}"]
                write(CONTENT / event / "_index.md", "\n".join(meta), body)
            else:
                title, body = take_title(body)
                write(CONTENT / event / f.name, f"title = {quote(title or toml_value(front, 'title'))}", body)

    shutil.rmtree(STATIC, ignore_errors=True)
    for event in events:
        if (src / "static" / event).is_dir():
            shutil.copytree(src / "static" / event, STATIC / event)
    for f in (src / "static").glob("*TLAConf19*"):
        (STATIC / "2019").mkdir(parents=True, exist_ok=True)
        shutil.copy2(f, STATIC / "2019" / f.name)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        main(Path(sys.argv[1]).resolve())
    else:
        with tempfile.TemporaryDirectory() as tmp:
            fetch(Path(tmp) / "conf")
            main(Path(tmp) / "conf")
