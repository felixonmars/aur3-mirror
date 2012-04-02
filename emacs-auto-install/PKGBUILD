# Maintainer: libkenta <libkenta@gmail.com>

pkgname=emacs-auto-install
pkgver=1.54
pkgrel=1
pkgdesc="Auto install elisp file"
arch=('i686' 'x86_64')
url="http://www.emacswiki.org/AutoInstall"
license=('GPL3')
depends=('emacs')
source=("http://www.emacswiki.org/emacs/download/auto-install.el")
install=$pkgname.install
md5sums=('5db0b32f0f651b4e4bf2db1c1e96cf66')

build() {
  cd "${srcdir}"
  emacs -batch -f batch-byte-compile auto-install.el
}

package() {
  cd "${srcdir}"
  install -Dm644 auto-install.el "${pkgdir}/usr/share/emacs/site-lisp/auto-install.el"
  install -Dm644 auto-install.elc "${pkgdir}/usr/share/emacs/site-lisp/auto-install.elc"
}
