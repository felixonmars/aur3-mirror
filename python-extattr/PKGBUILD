# Contributor: Christoph Siegenthaler <csi@gmx.ch>
pkgname=python-extattr
pkgver=0.1.3
pkgrel=1
pkgdesc="Python extension created to manipulate extended attributes in filesystems that support them"
url="http://rudd-o.com/projects/python-extattr/"
depends=('python' 'attr')
source=(http://rudd-o.com/wp-content/projects/files/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('9b554c8a24ec60edd26c663f124fbe8f')

build(){
	cd $startdir/src/$pkgname-$pkgver
	python setup.py install --root=$startdir/pkg
}
