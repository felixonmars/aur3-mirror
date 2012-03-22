#!/bin/sh

post_install() {
  cat << EOF
==> Put this in your '$HOME/.emacs' file to enable autoloading of ttl-mode

(autoload 'ttl-mode "ttl-mode" "Major mode for OWL or Turtle files" t)
(setq auto-mode-alist (append '(("\\.ttl$" . ttl-mode)
				("\\.n3$" . ttl-mode)) auto-mode-alist))
EOF
}

post_upgrade() {
  post_install $1
}
