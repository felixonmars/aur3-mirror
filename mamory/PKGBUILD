# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=mamory
pkgver=0.2.25
pkgrel=1
pkgdesc="A ROM management tool and library that can use ClrMamePro dat files or a MAME executable."
url="http://mamory.sourceforge.net/"
license=('GPL2')
arch=('i686')
depends=('expat' 'libtool')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('778f5e5c5be93fb0dfb1f3246e2df203')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
