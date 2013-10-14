# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=python2-cctrl
_pkgname=cctrl
pkgver=1.7.1
pkgrel=1
pkgdesc="cloudControl command line utilities"
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}"
license=('Apache')
depends=('python2' 'python-paramiko' 'python2-pycclib')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/c/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('4628f7e06017e685a9b5de3f67251d4db5b0ea686d0374d7971257e3ce576efc2fcefd0bc1d5279b11d7296296d2c598e9cb6c8c4361ba0170820894c95adc0b')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
