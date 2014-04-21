# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Brock.Zheng <goodmenzy@gmail.com>
pkgname=emacs-tup-mode
pkgver=1.3.0
pkgrel=2
epoch=
pkgdesc="An emacs major mode for editing tupfile --- TUP is a fast, file-based build system"
arch=(any)
url="https://github.com/ejmr/tup-mode.git"
license=('GPL3')
groups=()
depends=(emacs)
makedepends=(git emacs)
checkdepends=(emacs)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

_gitroot=https://github.com/ejmr/tup-mode.git
source=(tup-mode_git::git+$_gitroot#tag=v$pkgver)
md5sums=('SKIP')
noextract=()

prepare() {
  ln -s tup-mode_git $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  emacs --batch -f batch-byte-compile  tup-mode.el
}

check() {
  cd $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 tup-mode.el  $pkgdir/usr/share/emacs/site-lisp/tup-mode.el
  install -Dm644 tup-mode.elc $pkgdir/usr/share/emacs/site-lisp/tup-mode.elc
  install -Dm644 README.md    $pkgdir/usr/share/doc/$pkgname/README.md
}

# vim:set ts=2 sw=2 et:
