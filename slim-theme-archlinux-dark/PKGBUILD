pkgname=slim-theme-archlinux-dark
pkgver=1.0
pkgrel=2
pkgdesc="Dark slim theme for ArchLinux"
install=slim-theme-archlinux-dark.install
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
depends=('slim')
source=(http://www.small-solutions.nl/downloads/themes/slim/${pkgname}-${pkgver}-${pkgrel}.tar.gz)
md5sums=('3684a566348ffc60220063d701983525')

build() {
	cd ${srcdir}/archlinux-dark
	
	install -m 644 -D background-4.3.jpg ${pkgdir}/usr/share/slim/themes/archlinux-dark/background-4.3.jpg
	install -m 644 -D background-16.9.jpg ${pkgdir}/usr/share/slim/themes/archlinux-dark/background-16.9.jpg
	install -m 644 -D background-16.10.jpg ${pkgdir}/usr/share/slim/themes/archlinux-dark/background-16.10.jpg
	install -m 644 -D panel.png ${pkgdir}/usr/share/slim/themes/archlinux-dark/panel.png
	install -m 644 -D slim.theme ${pkgdir}/usr/share/slim/themes/archlinux-dark/slim.theme
}
