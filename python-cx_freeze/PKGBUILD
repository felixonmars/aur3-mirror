# Maintainer : SpepS <dreamspepser at yahoo dot it>

_pkg=cx_freeze
_tar=cx_Freeze
pkgname=python-$_pkg
pkgver=4.2.3
pkgrel=1
pkgdesc="A set of utilities for freezing Python3 scripts into executables."
arch=('i686' 'x86_64')
url="http://www.python.net/crew/atuining/$_tar/"
license=('custom')
depends=('python')
source=("http://downloads.sourceforge.net/cx-freeze/$_tar-$pkgver.tar.gz")
md5sums=('a524cfd23de5d37e0ec9400ba1ccd6ad')

build() {
  # nothing to do here
  return 0
}

package() {
  cd "$srcdir/$_tar-$pkgver"

  python setup.py install --root "$pkgdir/" --optimize 1

  # install custom license
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # prevent conflicts with cx_freeze
  cd "$pkgdir/usr/bin" && mv cxfreeze cxfreeze3
}
