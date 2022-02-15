# fail with a message
fail() {
  echo "FAIL: $1"
  exit 1
}

succeed() {
  echo "Successfully built resume.pdf"
  exit 0
}

# first argument is the tool, the second argument is where to install it
require_package() {
  if ! which "$1" >/dev/null; then
    fail "you must install $1 before building this project. see $2 for installation instructions."
  fi
}

# require a file to exist
require_file() {
  if [ ! -f "$1" ]; then
    fail "$1 does not exist."
  fi
}

ensure_pdf_is_one_page() {
  if [[ "$(pdfinfo $1 | awk '/^Pages:/ {print $2}')" != "1" ]]; then
    fail "$1 is more than one page"
  fi
}
