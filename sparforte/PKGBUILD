# Maintainer: Julian Leyh <julian@vgai.de>

pkgname=sparforte
pkgver=1.3.2
pkgrel=1
pkgdesc="The Business Shell with Sound Design"
arch=('i686' 'x86_64')
url="http://www.pegasoft.ca/sparforte.html"
license=('GPL')
depends=('sdl_image' 'postgresql-libs' 'libmysqlclient')
makedepends=('gcc-ada')
install=sparforte.install
source=(http://www.pegasoft.ca/downloads/${pkgname}-${pkgver}-src.tgz
        configure.patch
        apq-configure.patch)
md5sums=('42dd6c7788e97e39b8464f0417d0e93a'
         'bdcc4058695b2018755696ba738ee10c'
         '60559bffd40b210af2b3f68d17955676')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np0 -i ../configure.patch
  patch -Np0 -i ../apq-configure.patch

  ./configure --prefix=/usr \
              --arch=$CARCH \
              --make=make \
              --without-sound
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make RPM_BUILD_ROOT=1 DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
