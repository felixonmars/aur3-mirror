# Contributor: Qiang Sun <sunqiang@gmail.com>

pkgname=python2-mocker
_filename=mocker
pkgver=1.1
pkgrel=1
pkgdesc="Platform for test doubles in Python (mocks, stubs, fakes, and dummies)"
arch=(any)
url="http://labix.org/mocker"
license=('PSF')
depends=('python2')
options=(!emptydirs)
source=("http://launchpad.net/$_filename/trunk/$pkgver/+download/$_filename-$pkgver.tar.bz2")
md5sums=('bad3209d0ebbed32195f92a4ee4628c5')

build() {
	cd $srcdir/$_filename-$pkgver
	python2 setup.py install --root=$pkgdir/ --optimize=1
}
