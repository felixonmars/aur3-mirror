# Contributor: John McKnight <jmcknight@gmail.com>

pkgname=sqlclient
pkgver=1.3.0
pkgrel=2
pkgdesc="The GNUstep Database Support Library"
url="http://www.gnustep.org/"
license="GPL"
depends=('sqlite3' 'gcc')
makedepends=('gnustep-make')
source=(ftp://ftp.gnustep.org/pub/gnustep/libs/SQLClient-$pkgver.tar.gz)
md5sums=('5ec9bcee0d04c495fe4a53cbafc97305')

build() {
	cd $startdir/src/SQLClient-$pkgver
	./configure \
		--prefix=/opt/GNUstep \
		--disable-mysql-bundle \
		--disable-postgres-bundle
	make || return 1
	make GNUSTEP_INSTALLATION_DIR=$startdir/pkg/opt/GNUstep/System INSTALL_ROOT_DIR=$startdir/pkg install
}
