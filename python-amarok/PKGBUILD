# Contributor: Christoph Siegenthaler <csi@gmx.ch>
pkgname=python-amarok
pkgver=0.1.1
pkgrel=1
pkgdesc="An amaroK remote control class for Python"
url="http://rudd-o.com/projects/python-amarok/"
depends=('python-commandsplus')
source=(http://rudd-o.com/wp-content/projects/files/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f2e8a44f56fcc29346d1a10721ceddef')

build(){
	cd $startdir/src/$pkgname-$pkgver
	python setup.py install --root=$startdir/pkg
}
