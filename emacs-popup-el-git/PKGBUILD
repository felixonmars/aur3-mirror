# Maintainer: m039 <flam44 (at) gmail (dot) com>
# Contributors: jdarnold
#---------------------------------------------------------------

pkgname=emacs-popup-el-git
provides=('emacs-popup-el')
pkgrel=1
pkgver=1277ab1
pkgdesc="visual popup user interface library for Emacs"
url="https://github.com/auto-complete/popup-el"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git' 'make')
# install=$pkgname.install
source=('git://github.com/auto-complete/popup-el.git')
md5sums=('SKIP')

_gitname="popup-el"

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  emacs -Q -L . -batch -f batch-byte-compile *.el >&/dev/null
}

package() {
  _pkg_emacs="$pkgdir/usr/share/emacs/site-lisp/"
  
  cd $_gitname
  install -d $_pkg_emacs
  install -Dm644 *.{el,elc} $_pkg_emacs
}
