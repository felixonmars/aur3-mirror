# Contributor: hpestilence <hpestilence@gmail.com>
pkgname=openalpp
pkgver=20060714
pkgrel=1
pkgdesc="Object oriented wrapper for OpenAL."
arch=('i686')
url="http://alpp.sourceforge.net/"
license=('LGPL')
depends=('freealut' 'libvorbis' 'openscenegraph-uw')
makedepends=('pkgconfig')
options=(!libtool)
source=(http://download.gna.org/underware/sources/$pkgname-cvs-$pkgver.tar.gz)
md5sums=('904778a83862e1981b182ceff9caf663')

build() {
  cd $startdir/src/$pkgname-cvs-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
