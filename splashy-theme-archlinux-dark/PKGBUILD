pkgname=splashy-theme-archlinux-dark
pkgver=1.0
pkgrel=1
pkgdesc="Dark splashy theme for ArchLinux"
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
depends=('splashy')
source=(http://www.small-solutions.nl/downloads/themes/splashy/$pkgname-$pkgver.tar.gz)
md5sums=('cbf22dd6ef2588a115635c4184dcea48')

build() {
	cd ${srcdir}/archlinux-dark
	
	install -m 644 -D FreeSans.ttf ${pkgdir}/usr/share/splashy/themes/archlinux-dark/FreeSans.ttf
	install -m 644 -D background-1680.png ${pkgdir}/usr/share/splashy/themes/archlinux-dark/background-1680.png
	install -m 644 -D background-1920x1080.png ${pkgdir}/usr/share/splashy/themes/archlinux-dark/background-1920x1080.png
	install -m 644 -D background-1920x1200.png ${pkgdir}/usr/share/splashy/themes/archlinux-dark/background-1920x1200.png
	install -m 644 -D background.png ${pkgdir}/usr/share/splashy/themes/archlinux-dark/background.png
	install -m 644 -D background.xcf ${pkgdir}/usr/share/splashy/themes/archlinux-dark/background.xcf
	install -m 644 -D error.png ${pkgdir}/usr/share/splashy/themes/archlinux-dark/error.png
	install -m 644 -D suspend.png ${pkgdir}/usr/share/splashy/themes/archlinux-dark/suspend.png
	install -m 644 -D theme.xml ${pkgdir}/usr/share/splashy/themes/archlinux-dark/theme.xml
}
