# Contributor: Ricardo Honorato-Zimmer <rikardo.horo@gmail.com>
pkgname=python-libxml2dom
pkgver=0.4.7
pkgrel=1
pkgdesc="A traditional DOM wrapper around the Python bindings for libxml2"
arch=(i686 x86_64)
url="http://www.boddie.org.uk/python/libxml2dom.html"
license=('LGPL')
depends=('python' 'libxml2')
source=(http://www.boddie.org.uk/python/downloads/libxml2dom-${pkgver}.tar.gz)
 
build() {
	cd $startdir/src/libxml2dom-$pkgver
	python setup.py build
	python setup.py install --root=$startdir/pkg || return 1
}
md5sums=('48b3e77d1a0465215b5a2ff33f74d39e')
