pkgname=fbsplash-theme-itty-domy
pkgver=1
pkgrel=2
pkgdesc="itty-domy is a fbsplash theme for archlinux"
arch=('i686' 'x86_64')
license="GPL"
url="http://www.be-root.com/2009/10/19/theme-fbsplash-pour-archlinux-itty-domy/"
depends=('fbsplash')
optdepends=('kernel26-fbcondecor')
source=('http://www.be-root.com/downloads/itty-domy/itty-domy.tar.gz')
install=fbsplash-theme-itty-domy.install
md5sums=('a450a5ca481fea6f9207485c12889f0f')
build() {
	mkdir -p "${pkgdir}/etc/splash"
	cd "${pkgdir}/etc/splash"
	cp -a "${srcdir}/itty-domy" .
}
