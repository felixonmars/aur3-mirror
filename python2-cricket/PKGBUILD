# Maintainer: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=python2-cricket
_pkgname=cricket
pkgver=0.2.3
pkgrel=1
pkgdesc="A graphical tool to assist running test suites."
arch=(any)
url="https://github.com/pybee/cricket"
license=('BSD')
depends=('python2' 'python2-tkreadonly' 'python2-coverage')
optdepends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('2922a28e5c7c8b3bad3627e2f3245daf')

build()
{
  # Install using setup.py
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
