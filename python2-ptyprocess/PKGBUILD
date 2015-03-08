# Maintainer: Will Shanks <wsha dot code at g mail dot com>
_modulename=ptyprocess
pkgname=python2-${_modulename}
pkgver=0.4
pkgrel=1
pkgdesc="Run a subprocess in a pseudo terminal"
arch=(any)
url="https://github.com/pexpect/ptyprocess"
license=('ISC')
depends=('python2')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/${_modulename}/${_modulename}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/pexpect/${_modulename}/master/LICENSE")
md5sums=('d29b8bfd7d2df4d9e4a0f87aafe59018'
         'cfdcd51fa7d5808da4e74346ee394490')

package() {
  cd "${srcdir}/${_modulename}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  cd "${srcdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
