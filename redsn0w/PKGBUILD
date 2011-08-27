# Maintainer:  Devin Cofer <ranguvar@archlinux.us>

### NOTE: The redsn0w-linux_$pkgver.tar.bz2 package must be found yourself, and at your own risk --
### it may be illegal in your country of residence. Do not ask how/where to get it.

pkgname=redsn0w
pkgver=0.8
pkgrel=3
pkgdesc="Jailbreaking tool for iPod Touch and iPhone devices"
url="http://redsn0w.com/"
license=('custom')
arch=('i686' 'x86_64')

depends=('wxgtk>=2.8' 'openssl' 'libusb' 'bzip2' 'curl' 'zlib' 'libpng')
[ $CARCH == x86_64 ] && depends=('lib32-wxgtk>=2.8' 'lib32-openssl' 'lib32-libusb' 'lib32-bzip2' 'lib32-curl' 'lib32-zlib' 'lib32-libpng')
makedepends=('hd2u')

source=("redsn0w-linux_$pkgver.tar.bz2")
md5sums=('c6881fb380921025402c1670dddb4757')

build() {
	cd "$pkgname-linux_$pkgver"

	dos2unix license.txt || return 1
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1

	if [ $CARCH = i686 ]; then
		install -Dm755 redsn0w "$pkgdir/usr/bin/redsn0w" || return 1
	fi

	if [ $CARCH = x86_64 ]; then
		install -Dm755 redsn0w "$pkgdir/opt/$pkgname/redsn0w" || return 1
		mkdir -p "$pkgdir/usr/bin/"
		ln -s "$pkgdir/opt/$pkgname/redsn0w" "$pkgdir/usr/bin/redsn0w" || return 1
	fi
}
