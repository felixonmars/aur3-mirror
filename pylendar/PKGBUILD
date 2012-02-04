# Maintaner: zhtlancer <zeutaur@gmail.com>
pkgname=pylendar
pkgver=1.0
pkgrel=1
pkgdesc="Simple desktop calendar written in pygtk"
arch=('any')
url="http://sysphere.org/~anrxc/j/archives/2009/03/11/desktop_calendars/index.html"
license="GPL"
depends=('pygtk')
source=('pylendar.py')
md5sums=('bfcd9c9b63c30ae54a7485856642093c')

build() {
	echo "We have nothing to build"
}

package() {
	cd "$srcdir"
	install -Dm 755 pylendar.py ${pkgdir}/usr/bin/pylendar.py
}
