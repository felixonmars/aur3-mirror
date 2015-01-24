# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-btchip
pkgver=0.1.11
pkgrel=1
pkgdesc="Python library to communicate with BTChip dongle"
arch=('any')
depends=('python2' 'python2-hidapi')
makedepends=('git' 'python2-setuptools')
url="https://github.com/LedgerHQ/btchip-python"
license=('GPL3')
options=(!emptydirs)
source=($pkgname::git+https://github.com/LedgerHQ/btchip-python#commit=20fb52cc82f31462a8ad8476efa83d4ed7e2dbb7)
sha256sums=('SKIP')

build() {
  cd $pkgname

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $pkgname

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
