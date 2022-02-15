#!/bin/bash
set -euo pipefail

source ./scripts/utils.sh

# the main build function
main() {
  require_package "tectonic" "https://tectonic-typesetting.github.io/en-US/install.html"
  require_package "pdfinfo" "https://command-not-found.com/pdfinfo"
  require_file "resume.tex"
  tectonic resume.tex -p
  require_file "resume.pdf"
  ensure_pdf_is_one_page "resume.pdf"
  succeed
}

main
