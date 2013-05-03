# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Sebastian Wolf <fatmike303@gmail.com>
pkgname=vfu
pkgver=4.12
pkgrel=1
pkgdesc="A console (text mode) file manager for UNIX/Linux"
arch=('i686' 'x86_64')
url="http://cade.datamax.bg/vfu/"
license=('GPL2')
depends=('ncurses' 'pcre')
optdepends=('perl: for the rx_* archiving utilities'
            'rpmextract: for rx_rpm'
            'unrar: for rx_rar'
            'unzip: for rx_zip')
changelog=Changelog
install=$pkgname.install
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1b3a2347b8255b0b1578e6fac75788574a054a9d348f5370babe17458121aa61')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make CCDEF="$CFLAGS -D_FILE_OFFSET_BITS=64"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# binaries
	install -Dm755 vfu/vfu "$pkgdir/usr/bin/vfu"
	install -m755  rx/rx_* "$pkgdir/usr/bin/"

	# man page
	install -Dm644 vfu.1 "$pkgdir/usr/share/man/man1/vfu.1"

	# config
	install -Dm644 vfu.conf "$pkgdir/etc/vfu.conf"

	# documentation
	install -dm755 $pkgdir/usr/share/doc/$pkgname
	install -m644 \
		CONFIG \
		FAQ \
		HISTORY \
		README \
		THANKS.TO \
		TODO \
		XWINDOW.NOTES \
		$pkgdir/usr/share/doc/$pkgname
}

