#Maintainer: Laurie Clark-Michalek <bluepeppers@archlinux.us>
#Contributer: Chris Cain <zshazz@gmail.com>

pkgname=namebar
pkgver=0.5
pkgrel=2
pkgdesc="NameBar shows the icon and the name of the focused window in on the panel as well as buttons for minimizing/(un)maximizing and closing the window."
arch=("any")
url="http://gnome-look.org/content/show.php/DockBar?content=101643"
license=("GPL")
depends=("gnome-python-desktop" "gnome-panel")
source=("http://gnome-look.org/CONTENT/content-files/101643-namebar_0.5.tar.gz")

build () {
	cd ${srcdir}/${pkgname}_${pkgver}
	mkdir -p ${pkgdir}/usr/share/{pixmaps/${pkgname},${pkgname}/themes}
	mv themes/* ${pkgdir}/usr/share/$pkgname/themes
	mv pixmaps/* ${pkgdir}/usr/share/pixmaps/$pkgname
	install -Dm755 $pkgname.py ${pkgdir}/usr/bin/$pkgname.py
	install -Dm644 *.server ${pkgdir}/usr/lib/bonobo/servers/GNOME_NameBarApplet.server
}
md5sums=('6cbe8f5eb514159971d51ac2b95862b7')
