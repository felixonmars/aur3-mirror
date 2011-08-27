# Contributor: John McKnight <jmcknight@gmail.com>

pkgname=performance
pkgver=0.2.4
pkgrel=2
pkgdesc="Helps improve the performance of GNUstep applications."
url="http://www.gnustep.org/"
license="GPL"
depends=('glibc')
makedepends=('gnustep-make')
source=(ftp://ftp.gnustep.org/pub/gnustep/libs/Performance-$pkgver.tar.gz)
md5sums=('5b1106ec1dd9bb8248216ec8c1011102')

build() {
	cd $startdir/src/Performance-$pkgver
	make || return 1
	make GNUSTEP_INSTALLATION_DIR=$startdir/pkg/opt/GNUstep/System INSTALL_ROOT_DIR=$startdir/pkg install
}
