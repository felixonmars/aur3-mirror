# $Id$

pkgname=emacs-smartparens-git
pkgver=0+650+g9dcb7a0
pkgrel=1
pkgdesc='An Emacs minor mode that deals with paren pairs and tries to be smart about it'
arch=('any')
url="https://github.com/Fuco1/smartparens"
depends=('emacs' 'emacs-dash')
makedepends=('git')
provides=('emacs-smartparens')
conflicts=('emacs-smartparens')
license=('GPL')
source=('git+https://github.com/Fuco1/smartparens')
sha256sums=('SKIP')

pkgver() {
  cd 'smartparens'
  echo "0+$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)"
}

build() {
  cd 'smartparens'

  # elpa file
  rm smartparens-pkg.el

  # byte compile
  emacs -batch -f batch-byte-compile smartparens.el
  emacs -batch -l smartparens.elc -f batch-byte-compile \
    smartparens-config.el \
    smartparens-html.el \
    smartparens-latex.el \
    smartparens-lua.el \
    smartparens-ruby.el
}

package() {
  cd 'smartparens'

  # create destination path
  install -d "$pkgdir/usr/share/emacs/site-lisp/smartparens"

  # copy over files into path
  install -Dm644 *.el *.elc "$pkgdir/usr/share/emacs/site-lisp/smartparens"
}

# vim: ts=2 sw=2 et
