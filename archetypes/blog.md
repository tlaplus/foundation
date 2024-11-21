+++
type = "blog"
menuPre = " "
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
linkTitle = ''
description = ""
date = {{ .Date }}
draft = true
+++