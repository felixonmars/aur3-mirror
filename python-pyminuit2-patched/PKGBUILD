# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python-pyminuit2-patched
pkgver=1.1.0
pkgrel=1
pkgdesc="Minuit2 numerical function minimization in Python"
arch=('any')
url="https://code.google.com/p/pyminuit2/"
license=('GPL2')
depends=('python' 'root')
conflicts=('python-pyminuit2')
provides=('python-pyminuit2')
options=(!emptydirs)
source=("https://pyminuit2.googlecode.com/files/pyminuit2-${pkgver}.tar.gz"
        'argname.patch'
        'setup.patch')
md5sums=('01ea4486e8910a62c806e472d241c509'
         'a14da5ffde792773a3710ae70baf5954'
         'af52d7f1133199c184fbef12530b6c8d')

prepare() {
  cd "$srcdir/pyminuit2-$pkgver"
  patch -p1 -i "$srcdir/setup.patch"
  patch -p1 -i "$srcdir/argname.patch"
}

package() {
  cd "$srcdir/pyminuit2-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
