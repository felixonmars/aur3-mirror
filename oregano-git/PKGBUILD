# Maintainer: Glen Oakley <goakley123@gmail.com>
pkgname=oregano-git
pkgver=v0.69.9.135.g926d6e1
pkgrel=2
pkgdesc="Schematic capture and circuit simulator"
arch=('any')
depends=('goocanvas' 'gtk3' 'gtksourceview3' 'libxml2' 'intltool')
makedepends=('git' 'waf')
provides=('oregano')
install='oregano.install'
url="https://github.com/drahnr/oregano"
license=("GPL2")
source=(git://github.com/drahnr/oregano.git oregano.install)
sha512sums=('SKIP' '1761a2bede604d071e81cc3436042e277871d0f6775fa0e6a70004195338e572f25a1b1cbe44dd252c4b1167bbd4061e51a24a00999fbb65c1c6e087144cc995')

_gitroot=git://github.com/drahnr/oregano.git
_gitname=oregano

pkgver () {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's/-/./g'
}

build() {
  cd "$srcdir"
  cd "$_gitname"
  waf configure --prefix=/usr
  waf debug
}

package() {
  cd "$srcdir/$_gitname"
  waf install --destdir=$pkgdir
}
