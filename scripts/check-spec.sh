#!/usr/bin/env bash
# Parse and model-check the homepage spec. Usage: scripts/check-spec.sh [path/to/Spec.tla]
set -euo pipefail

root=$(cd "$(dirname "$0")/.." && pwd)
spec=$(realpath "${1:-$root/assets/spec/Foundation.tla}")
java=${JAVA:-java}
version=v1.7.4
sha256=936a262061c914694dfd669a543be24573c45d5aa0ff20a8b96b23d01e050e88
cache=${XDG_CACHE_HOME:-$HOME/.cache}/tla2tools
jar=$cache/tla2tools-$version.jar

if [[ ! -f $jar ]]; then
  mkdir -p "$cache"
  curl -fsSL -o "$jar.tmp" \
    "https://github.com/tlaplus/tlaplus/releases/download/$version/tla2tools.jar"
  echo "$sha256  $jar.tmp" | sha256sum -c --quiet
  mv "$jar.tmp" "$jar"
fi

cd "$(dirname "$spec")"
module=$(basename "$spec" .tla)

# SANY 1.7.4 exits 0 on semantic errors, so its output is the signal.
sany=$("$java" -cp "$jar" tla2sany.SANY "$spec") || { echo "$sany"; exit 1; }
echo "$sany"
if grep -qE '^\*\*\* Errors|Semantic errors|Parse Error' <<<"$sany"; then
  echo "SANY reported errors in $module" >&2
  exit 1
fi

metadir=$(mktemp -d)
trap 'rm -rf "$metadir"' EXIT
"$java" -XX:+UseParallelGC -cp "$jar" tlc2.TLC \
  -workers auto -metadir "$metadir" "$module"
