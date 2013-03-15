# Contributor: bug <bug2000@gmail.com>
# Maintainer: bug <bug2000@gmail.com>
pkgname=openspc
pkgver=0.3.1
pkgrel=1
pkgdesc="SPC player"
arch=("i686")
url="http://membres.multimania.fr/pixels/OpenSPC.html"
license=('GPL')
depends=("esd")
install=
source=(http://membres.multimania.fr/pixels/OpenSPC-$pkgver.tar.gz)
noextract=()
md5sums=('f39d88694eb31341420572872b1743c8')

build() {
  cd "$srcdir/OpenSPC-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
