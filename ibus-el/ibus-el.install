#!/bin/sh
post_install() {
    cat <<EOF
Add these stuff to you .emacs:
  (require 'ibus)
  ;; Turn on ibus-mode automatically after loading .emacs
  (add-hook 'after-init-hook 'ibus-mode-on)
  ;; Choose your key to toggle input status:
  (global-set-key (kbd "C-\\\\") 'ibus-toggle)
Or if you use emacsclient, replace init-hook line by these:
  (add-hook 'after-make-frame-functions
    (lambda (new-frame)
            (select-frame new-frame)
            (or ibus-mode (ibus-mode-on))))
IMPORTANT!
Archlinux uses Python 3, so add this to your (custom-set-variables):
  (custom-set-variables '(ibus-python-shell-command-name "python2"))
EOF
}

post_upgrade() {
    post_install
}
