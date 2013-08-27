# Maintainer: msimav
pkgname=python-epc
pkgver=0.0.5
pkgrel=1
pkgdesc="EPC (RPC stack for Emacs Lisp) server for Python"
arch=('any')
url="https://github.com/tkf/python-epc"
license=('GPLv3')
depends=('python' 'python-sexpdata')
source=("http://pypi.python.org/packages/source/e/epc/epc-${pkgver}.tar.gz")
md5sums=('de54a24ace8a9b3f5b2d8f014b8c4a42')

package() {
  cd "$srcdir/epc-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
