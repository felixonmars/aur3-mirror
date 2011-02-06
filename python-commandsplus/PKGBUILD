# Contributor: Christoph Siegenthaler <csi@gmx.ch>
pkgname=python-commandsplus
pkgver=0.2.3
pkgrel=2
pkgdesc="a Python module which complements the existing commands module with an extra function getstatusoutputerror"
url="http://rudd-o.com/projects/python-commandsplus/"
depends=('python')
source=(http://rudd-o.com/wp-content/projects/files/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5b9a45f9b5b3e935cde7b70c6bc34395')

build(){
	cd $startdir/src/$pkgname-$pkgver
	python setup.py install --root=$startdir/pkg
}
