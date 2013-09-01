# Maintainer: Jason Kölker <jason@koelker.net>
pkgname=nattraverso
pkgver=0.1.1
pkgrel=1
pkgdesc='A NAT Traversal library'
arch=('any')
url='https://pypi.python.org/pypi/nattraverso'
license=('LGPL')
depends=('python2' 'twisted' 'python2-soappy')
makedepends=('setuptools')
backup=()
source=("https://pypi.python.org/packages/source/n/nattraverso/nattraverso-$pkgver.tar.gz")
md5sums=('96b9c39864db3587effc2859c5cc75b0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/raise.*/pass/' setup.py
  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
