# Maintainer: François Gindraud <francois.gindraud@gmail.com>
pkgname=python2-islpy
pkgver=2014.1.1
pkgrel=0
pkgdesc="ISL library python bindings"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/islpy"
license=('MIT')
depends=('python2' 'boost-libs' 'gmp')
makedepends=('python2-setuptools' 'boost')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/i/islpy/islpy-$pkgver.tar.gz" "LICENSE")
md5sums=('dababae24d921330996c10ec016a9d7f'
         '0c7c9ea0d2ff040ba4a25afa0089624b')

package() {
  cd "$srcdir/islpy-$pkgver"
  
  python2 configure.py --prefix="$pkdir" --no-use-shipped-boost --boost-python-libname=boost_python
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
