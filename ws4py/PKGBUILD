# Maintainer: korjjj <korjjj@gmail.com>

pkgname=ws4py
pkgver=0.3.4
pkgrel=1
pkgdesc='WebSocket client and server library for Python.'
arch=('any')
url='https://pypi.python.org/pypi/ws4py'
license=('BSD')
depends=('python')
source=("https://pypi.python.org/packages/source/w/ws4py/${pkgname}-${pkgver}.tar.gz")
md5sums=('6b47e33cbd13f5c134b04f2a44a480ad')

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
