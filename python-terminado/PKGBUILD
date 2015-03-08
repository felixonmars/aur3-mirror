# Maintainer: Will Shanks <wsha dot code at g mail dot com>
_modulename=terminado
pkgname=python-${_modulename}
pkgver=0.5
pkgrel=1
pkgdesc="Terminals served to term.js using Tornado websockets"
arch=(any)
url="https://github.com/takluyver/terminado"
license=('BSD')
depends=('python' 'python-tornado' 'python-ptyprocess')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/${_modulename}/${_modulename}-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/takluyver/${_modulename}/master/LICENSE.txt")
md5sums=('e992c6262a5f4c8952fee93da31a067e'
         '242c3ea7df130edf77dc0e088ac1847c')

package() {
  cd "${srcdir}/${_modulename}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  cd "${srcdir}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
