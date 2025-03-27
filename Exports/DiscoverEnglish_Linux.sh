#!/bin/sh
echo -ne '\033c\033]0;Cartilla_interactiva\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/DiscoverEnglish_Linux.x86_64" "$@"
