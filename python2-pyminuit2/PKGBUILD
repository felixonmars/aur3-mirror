# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python2-pyminuit2
pkgver=1.1.0
pkgrel=1
pkgdesc="Minuit2 numerical function minimization in Python"
arch=('any')
url="https://code.google.com/p/pyminuit2/"
license=('GPL2')
depends=('python2' 'root')
options=(!emptydirs)
source=("https://pyminuit2.googlecode.com/files/pyminuit2-${pkgver}.tar.gz")
md5sums=('01ea4486e8910a62c806e472d241c509')

package() {
  cd "$srcdir/pyminuit2-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
