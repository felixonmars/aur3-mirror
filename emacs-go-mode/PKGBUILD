# Maintainer: philanecros <philanecros@gmail.com>

pkgname=emacs-go-mode
_pkgname=emacs-go-mode
_srcname=go-mode.el
pkgver=1.0.0.r0.gf1adac0
pkgrel=1
pkgdesc="An improved Go mode for emacs"
arch=('any')
url="https://github.com/dominikh/go-mode.el"
license=('BSD')
depends=('emacs')
makedepends=('git')
provides=('emacs-go-mode')
conflicts=('emacs-go-mode-git')
install=emacs-go-mode.install
source=("$_pkgname::git+https://github.com/dominikh/go-mode.el.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  emacs -batch -f batch-byte-compile *.el
}

package() {
  cd $srcdir/$_pkgname

  install -dm755 $pkgdir/usr/share/emacs/site-lisp/go-mode
  install -D -m644 *.el{c,} AUTHORS LICENSE README.md "${pkgdir}/usr/share/emacs/site-lisp/go-mode"
}

# vim:set ts=2 sw=2 et:
