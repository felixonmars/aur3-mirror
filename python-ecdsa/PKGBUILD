# Maintainer: Samuel Tardieu <sam@rfc1149.net>
pkgname=python-ecdsa
pkgver=0.9
pkgrel=1
pkgdesc="Implementation of ECDSA in Python"
arch=('any')
url="https://github.com/warner/python-ecdsa"
license=('custom')
groups=()
depends=('python')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/e/ecdsa/ecdsa-$pkgver.tar.gz" "LICENSE")
md5sums=('2b9c35245ce391d6b7d8f991aad5c630' '66ffc5e30f76cbb5358fe54b645e5a1d')

package() {
  cd "$srcdir/ecdsa-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
