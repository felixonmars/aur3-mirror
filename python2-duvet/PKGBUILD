# Maintainer: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=python2-duvet
_pkgname=duvet
pkgver=0.1.2
pkgrel=1
pkgdesc="A GUI tool for visualizing code coverage results."
arch=(any)
url="https://github.com/pybee/duvet"
license=('BSD')
depends=('python2' 'python2-tkreadonly' 'python2-coverage')
optdepends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/d/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('3c37e8e4bf3d35e21b647f31b73f512f')

build()
{
  # Install using setup.py
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
