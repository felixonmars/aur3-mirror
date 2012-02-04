# Maintainer Brad Arrington

pkgname=opencvs
pkgver=20110824193500
pkgrel=1
pkgdesc="OpenCVS"
arch=(i686 x86_64)
url="http://www.opencvs.org/"
license=('GPL')
depends=('gcc')
source=(http://chl.be/opencvs/${pkgname}-${pkgver}.tar.gz)
md5sums=('7abbcd1aa34906f5f0b631f7e502e59f')

build() {

  cd "$srcdir/$pkgname"
  ./bootstrap
  ./configure --prefix=/usr
  cd openbsd-compat
  make || return 1
  cd ../src
  make || return 1
  make DESTDIR="$pkgdir/" install
}
