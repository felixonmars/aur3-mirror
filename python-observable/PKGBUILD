# Contributor: Christoph Siegenthaler <csi@gmx.ch>
pkgname=python-observable
pkgver=0.1.0
pkgrel=1
pkgdesc="An implementation of the Observer/Observable pattern in python"
url="http://rudd-o.com/projects/python-observable/"
depends=('python')
source=(http://rudd-o.com/wp-content/projects/files/python-Observable/python-Observable-$pkgver.tar.gz)
md5sums=('e3d9b16435986a2ae1f0f8ead284879d')

build(){
	cd $startdir/src/python-Observable-$pkgver
	python setup.py install --root=$startdir/pkg
}
