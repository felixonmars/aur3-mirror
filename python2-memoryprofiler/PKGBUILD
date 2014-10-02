# Maintainer: Rich Li <rich at dranek dot com>
pkgname=python2-memoryprofiler
_py_pkgname=memory_profiler # The pypi package name
pkgver=0.32
pkgrel=1
pkgdesc="A module for monitoring memory usage of a python program"
arch=('any')
url="http://pypi.python.org/pypi/memory_profiler"
license=('BSD')
depends=('python2' 'python2-psutil')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/m/$_py_pkgname/$_py_pkgname-$pkgver.tar.gz)
md5sums=('c65310467e05d8db4b10fa65534f3e5d')

package() {
  cd "$srcdir/$_py_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # There isn't a license file included, 
  # and the documentation says it's simplified BSD
  # So if I can create a valid LICENSE file then I can do:
  #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
