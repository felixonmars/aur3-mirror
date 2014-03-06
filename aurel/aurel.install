#!/bin/sh

post_install() {
 cat << EOF
==> To start using this package, Aadd the following lines to your .emacs
(add-to-list 'load-path "/usr/share/emacs/site-lisp/aurel")
(require 'aurel)

;; autoloads for the interactive functions
(autoload 'aurel-package-info "aurel" nil t)
(autoload 'aurel-package-search "aurel" nil t)
(autoload 'aurel-maintainer-search "aurel" nil t)

;; directory where the packages will be downloaded
(setq aurel-download-directory "~/abs")

More infos on: https://github.com/alezost/aurel
EOF
}

post_upgrade() {
  post_install $1
}
