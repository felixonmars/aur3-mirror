#!/bin/bash

post_install() {

  echo ""
  echo "To enable auto-loading of dylan-mode upon loading a .dylan file, add these"
  echo "lines to your .emacs file:"
  echo ""
  echo "(autoload 'dylan-mode \"dylan-mode\" \"Dylan-mode\" t)"
  echo "(setq auto-mode-alist (cons '(\"\\\\.dylan\\\\'\" . dylan-mode) auto-mode-alist))"
  echo ""
}

post_upgrade() {

  post_install

}

op=$1
shift

$op $*

