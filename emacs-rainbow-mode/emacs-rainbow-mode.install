#!/bin/sh

post_install() {
  cat << EOF
==> Put this in your '$HOME/.emacs' file to enable autoloading of rainbow-mode
==> when editing css files

(defun css-rainbow-mode() (css-mode) (rainbow-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . css-rainbow-mode))

EOF
}

post_upgrade() {
  post_install $1
}
