#!/bin/sh

post_install() {
 cat << EOF
==> To start using this package, add the lines below to your . emacs file.
(add-to-list 'load-path "/usr/share/emacs/site-lisp/web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))  
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))  
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))  
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))  
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))  
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))  
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

More infos on: http://web-mode.org/
EOF
}
        
post_upgrade() {
  post_install $1
}
