+++
type = "default"
menuPre = " "
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
linkTitle = ''
weight = 1
alwaysopen = false
hideifempty = true
+++

{{% children containerstyle="div" style="h2" description=true %}}