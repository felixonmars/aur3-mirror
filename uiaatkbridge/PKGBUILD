# Contributor: Ray Wang <rawang at novell dot com>

pkgname=uiaatkbridge
pkgver=1.0
pkgrel=1
pkgdesc="Bridge between UIA providers and ATK"
arch=('i686' 'x86_64')
url="http://www.mono-project.com/Accessibility"
license=('custom:MIT/X11')
depends=('mono' 'mono-uia' 'uiautomationwinforms' 'at-spi')
makedepends=('mono' 'mono-uia' 'uiautomationwinforms' 'at-spi')
source=(http://ftp.novell.com/pub/mono/sources/uiaatkbridge/uiaatkbridge-1.0.tar.bz2
	MIT.X11)
md5sums=('f628357245b93142067c2364f14f4a2c'
	 '03813a921754a458569e3fb8c182d596')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --disable-tests
	make || return 1
	make DESTDIR=$pkgdir install || return 1

	#install license
	mkdir -p ${startdir}/pkg/usr/share/licenses/$pkgname/
	install -m 644 ${startdir}/MIT.X11 ${startdir}/pkg/usr/share/licenses/$pkgname/
}
