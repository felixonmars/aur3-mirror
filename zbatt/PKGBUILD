# Maintainer: Alexej Magura <agm2819*gmail*>
#
#
pkgname=zbatt
_realname=zelda-battery
pkgver=3.0.3
pkgrel=2
pkgdesc="A Legend of Zelda inspired health-bar battery meter for Shell prompts
and Taskbars"
arch=('i686' 'x86_64')
url="https://github.com/amagura/zelda-battery"
license=('Apache')
depends=('gtk2' 'python2')
makedepends=('cython' 'pkgconfig')
source=("https://github.com/amagura/zelda-battery/archive/v${pkgver}.tar.gz")
md5sums=('9cce15636093acd6da146264dbc62f0b')


prepare () {
  cd "$srcdir/$_realname-$pkgver"
  autoreconf -i
  ./configure --prefix=/usr
}

build () {
  cd "$srcdir/$_realname-$pkgver"
  make
}

package () {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="$pkgdir" install
}
