#!/bin/bash
set -euo pipefail

source ./scripts/utils.sh

main() {
  require_package "inotifywait" "https://github.com/inotify-tools/inotify-tools/wiki#getting-inotify-tools"
  require_file "resume.tex"
  echo "watching resume.tex for changes..."
  inotifywait -q -m -e close_write resume.tex |
  while read -r filename event; do
    echo "resume.tex changed, rebuilding resume.pdf"
    ./scripts/build.sh
  done
}

main
