# Maintainer: Shacristo <Shacristo at gmail dot com>
# Contributor: Jáchym Barvínek <jachymb@gmail.com>
pkgname=lybniz
pkgver=1.3.2
pkgrel=2
pkgdesc="An easy to use mathematical function graph plotter written in Python and GTK."
arch=(any)
url="http://sourceforge.net/projects/lybniz2/"
license=('BSD')
depends=('python2' 'pygtk')
source=(http://switch.dl.sourceforge.net/sourceforge/${pkgname}2/$pkgname-$pkgver.tar.gz)
md5sums=('0effc8eba87cfa3514ec54157e7f9815')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i -e 's/\/usr\/bin\/env python/\/usr\/bin\/env python2/' "setup.py"
	./setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	./setup.py install --root=$pkgdir/
	sed -i -e 's/\/usr\/bin\/env python/\/usr\/bin\/env python2/' "$pkgdir/usr/bin/lybniz.py"
	mv "$pkgdir/usr/bin/lybniz.py" "$pkgdir/usr/bin/lybniz"
}

# vim:set ts=2 sw=2 et:
