# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=python2-draxoft-auth-pam
_name=draxoft.auth.pam
pkgver=0.1.2
pkgrel=1
pkgdesc="Provides a Python-style interface to PAM's C API (draxoft.auth.pam)"
url="https://pypi.python.org/pypi/draxoft.auth.pam"
arch=('i686' 'x86_64')
license=('LGPL2')
depends=('python2')
source=(https://pypi.python.org/packages/source/d/draxoft.auth.pam/draxoft.auth.pam-${pkgver}.tar.bz2)
sha256sums=('9e5103a9d5c17277ea074f3aa80800c83f7fc548c5b6d8ca5db2a2c90ea2ef58')

build() {
  cd "$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$_name-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
