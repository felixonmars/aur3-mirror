#!/bin/sh

post_install() {
  cat << EOF
==> To start using this package, add the lines below to your .emacs file.
(add-to-list 'load-path "/usr/share/emacs/site-lisp/smex")
(require 'smex)
(smex-initialize); Can be omitted. This might cause a (minimal) delay
		 ; when Smex is auto-initialized on its first run.
EOF
}

post_upgrade() {
  post_install $1
}
