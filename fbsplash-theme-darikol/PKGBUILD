pkgname=fbsplash-theme-darikol
pkgver=1
pkgrel=1
pkgdesc="Darikol is a fbsplash theme for archlinux"
arch=('i686' 'x86_64')
license="GPL"
url="http://www.be-root.com/2009/10/08/theme-fbsplash-pour-archlinux-darikol/"
depends=('fbsplash')
optdepends=('kernel26-fbcondecor')
source=('http://www.be-root.com/downloads/darikol/darikol.tar.gz')
install=fbsplash-theme-darikol.install
md5sums=('e34f51445a047828588ce49137caa99e')
build() {
	mkdir -p "${pkgdir}/etc/splash"
	cd "${pkgdir}/etc/splash"
	cp -a "${srcdir}/darikol" .
}
