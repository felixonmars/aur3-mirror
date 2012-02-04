# Contributor: Andreas Baumann <abaumann@yahoo.com>

pkgname=pvr350player
pkgver=1.1
pkgrel=2
pkgdesc="Simple command line player for IVTV PVR 350 cards (TV out)"
arch=('i686' 'x86_64')
url="http://www.deniscarl.com/pvr350player"
makedepends=()
optdepends=()
depends=()
conflicts=()
provides=()
replaces=()
backup=()
license=('GPL')
options=()
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('2b7a3ef1505b3b79b8101d5d373508b5')

build() {
  cd ${srcdir}/${pkgname}_${pkgver}

  make || return 1
  mkdir -p ${pkgdir}/usr/bin
  sed -i "s@/usr/local@${pkgdir}/usr@g" Makefile
  make install || return 1
}
