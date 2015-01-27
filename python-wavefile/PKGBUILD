# Maintainer: Tim Langlois <langlois at cs dot cornell dot edu>
_pkgname=wavefile
pkgname=python-$_pkgname
pkgver=1.4
pkgrel=1
pkgdesc="Pythonic libsndfile wrapper to read and write audio files."
arch=('any')
url="https://github.com/vokimon/python-wavefile"
license=('GPL3')
groups=()
depends=()
makedepends=('setuptools')
provides=('python-wavefile')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/w/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('4427a9a24536bf759e9e791d4424c6b4')

package_python-wavefile() {
  depends+=('python>=3.1')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-wavefile() {
  depends+=('python2>=2.7')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
