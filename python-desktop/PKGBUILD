# Contributor: Paulo Ruthes <paulo.ruthes@gmail.com>
pkgname=python-desktop
pkgver=0.3
pkgrel=1
pkgdesc="Simple desktop integration for Python"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/desktop"
license=('LGPL')
depends=(python)
source=(http://www.boddie.org.uk/python/downloads/desktop-$pkgver.tar.gz)
md5sums=('4b962068863de0e0e79c8540bc15a15a')

build() {
	cd $startdir/src/desktop-$pkgver
	python setup.py install --root=$startdir/pkg || return 1
	install -D $startdir/src/desktop-$pkgver/docs/LICENCE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
