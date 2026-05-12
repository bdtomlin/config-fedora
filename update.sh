#!/bin/bash

add_sym_links() {
  stow -d ~/config-fedora -t ~/.config --ignore='^home_dotfiles' --ignore='^update.sh' --ignore='^setup.sh' --ignore='^Readme.md' --ignore='^.git' --ignore='^.DS_Store' .
  stow -d ~/config-fedora/home_dotfiles -t ~/ --ignore='^.DS_Store' --ignore='^(?!\.).+' .
}

remove_sym_links() {
  stow -D -d ~/config-fedora -t ~/.config .
  stow -D -d ~/config-fedora/home_dotfiles -t ~/ .
}

update_sym_links() {
  remove_sym_links
  add_sym_links
}

if [ -z "$1" ]; then
  update_sym_links
else
  while [[ "$#" -gt 0 ]]; do
    case $1 in
    -r | --remove)
      remove_sym_links
      shift
      ;;
    *)
      echo "Unknown parameter passed: $1"
      exit 1
      ;;
    esac
    shift
  done
fi
