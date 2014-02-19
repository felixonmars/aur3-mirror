# Maintainer: Bernhard Beschow <bbeschow@cs.tu-berlin.de>

pkgname=lit
pkgver=0.2.0
pkgrel=1
pkgdesc="A Software Testing Tool"
url="https://pypi.python.org/pypi/lit"
license=(BSD)
groups=(llvm)

arch=(any)
makedepends=()
depends=(llvm python2)
source=("https://pypi.python.org/packages/source/l/${pkgname}/${pkgname}-${pkgver}.tar.gz")

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

sha256sums=('e1608b9ff82c7eaa61bce5fd95256986d50a672e8015c7715de5c857c588f21e')
