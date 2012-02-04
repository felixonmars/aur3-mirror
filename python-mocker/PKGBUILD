# Contributor: Hubert Czobodziński <hcz@onet.eu>

pkgname=python-mocker
_filename=mocker
pkgver=1.0
pkgrel=1
pkgdesc="Platform for test doubles in Python (mocks, stubs, fakes, and dummies)"
arch=(any)
url="http://labix.org/mocker"
license=('PSF')
depends=('python')
options=(!emptydirs)
source=("http://launchpad.net/$_filename/trunk/$pkgver/+download/$_filename-$pkgver.tar.bz2")
md5sums=('11bb3bb3cb1a1569a0555b01b6983172')

build() {
	cd $srcdir/$_filename-$pkgver
	python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
