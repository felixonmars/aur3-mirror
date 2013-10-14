# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=python2-pycclib
_pkgname=pycclib
pkgver=1.3.1
pkgrel=1
pkgdesc="Python library for the cloudControl API"
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}"
license=('Apache')
depends=('python2' 'python2-httplib2')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('08c9d2eb5243a1aeb349b4d145ed0faefc1c6943a5bf142b2fc99434dc9512484046228a39bc36b9bab20149092a9f393c4f10856454e431a7cd5b6894e28894')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
