#!/bin/sh

post_install() {
  cat << EOF
==>  Add the following code to your init file, of course you can bind ace-jump-mode to a key of your choice.
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;;If you also use viper mode :
(define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;;If you use evil
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

==> For more detail, see the help of ace-jump-mode.
EOF
}

post_upgrade() {
  post_install $1
}
