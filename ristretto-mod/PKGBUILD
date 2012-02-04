pkgname=ristretto-mod
_pkgname=ristretto
pkgver=0.0.22
pkgrel=1
pkgdesc="Ristretto with keyboard navigation and modified Mousewheel behaviour"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/ristretto"
license=('GPL2')
depends=('libjpeg' 'librsvg' 'libpng' \
         'libxfcegui4' 'thunar')
makedepends=('intltool' 'pkgconfig')
options=('!libtool')
conflicts=('ristretto')
source=(http://goodies.xfce.org/releases/$_pkgname/$_pkgname-$pkgver.tar.gz
http://rob.kingofnerds.net/$pkgname-$pkgver.patch)
install=ristretto.install
md5sums=('978ae19472c5a0b7d4b6622a68234a67'
         '9b9062ebc95d79be63b63e5749d5c3bf')

build() {
  cd ${srcdir}/$_pkgname-$pkgver
  cd src
  patch -p1 < ${startdir}/$pkgname-$pkgver.patch
  cd ..
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
