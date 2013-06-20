# Contributor: Jeff Bailes <thepizzaking@gmail.com>
 
pkgname=whaawmp
pkgver=0.2.14
pkgrel=1
pkgdesc="A GTK+ Media player written in python and using gstreamer"
arch=('i686' 'x86_64')
url="http://home.gna.org/whaawmp/"
license=('GPL3' 'custom')
makedepends=('intltool')
depends=('pygtk' 'gstreamer0.10-python' 'pyxdg' 'gstreamer0.10-good')
optdepends=('gstreamer0.10-bad-plugins: for DVD menu support')
source=(http://download.gna.org/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('b4ce6113879c2ffb50868d5df471380de1fb8800ce2191cc7f0821f1d11a61da')
 
 
build() {
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py install --prefix=/usr --root=$pkgdir
	mkdir -p $pkgdir/usr/share/licenses/whaawmp/
	cp $srcdir/$pkgname-$pkgver/COPYING $pkgdir/usr/share/licenses/whaawmp/
}