#!/bin/sh

post_install() {
  cat << EOF
==>  To start using this package, add the lines below to your .emacs file.
(add-to-list 'load-path "/usr/share/emacs/site-lisp/guru-mode")
(require 'guru-mode)
(guru-global-mode +1) ;; enable guru-mode globally
EOF
}

post_upgrade() {
  post_install $1
}
