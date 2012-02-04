_pypkgname=uuid
pkgname=python-uuid
pkgver=1.30
pkgrel=2
pkgdesc="UUID object and generation functions"
arch=(i686 x86_64)
url="http://zesty.ca/python/uuid.html"
license=('GPL')
groups=()
depends=(python)
makedepends=(setuptools)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
md5sums=(639b310f1fe6800e4bf8aa1dd9333117)
source=(http://pypi.python.org/packages/source/u/$_pypkgname/$_pypkgname-$pkgver.tar.gz)
noextract=()

build() {
	cd $srcdir/$_pypkgname-$pkgver
	python setup.py install --root=$startdir/pkg --prefix=/usr || return 1
}

# vim:set ts=2 sw=2 et:
