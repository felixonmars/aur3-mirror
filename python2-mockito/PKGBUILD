# Maintainer: Korantin Auguste <contact@palkeo.com>
pkgname=python2-mockito
pkgver=0.5.1
pkgrel=1
pkgdesc="Mockito-python is a Test Spy Framework based on Java library of the same name. "
arch=(any)
url="https://code.google.com/p/mockito-python/"
license=('MIT')
depends=()
makedepends=()
source=(https://mockito-python.googlecode.com/files/mockito-python-$pkgver.tar.gz)
noextract=()
md5sums=('814669d5a6f1dc051f409d8c3521da64')

package() {
  cd "$srcdir/mockito-python"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
