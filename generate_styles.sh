#!/bin/bash

STYLES=(base16 colorful github gruvbox molokai monokai monokai.sublime thankful_eyes)

for style in ${STYLES[*]}; do
    Title=${style^}
    cat<<EOF > $style.adoc
= $Title
:!webfonts:
:source-highlighter: rouge
:rouge-style: $style

.:rouge-style: $style
[source, javascript, linenums,start=123]
----
include::dracula-screenshot.js[]
----
EOF
done
