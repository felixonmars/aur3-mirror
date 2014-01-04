# Maintainer: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=python2-tkreadonly
_pkgname=tkreadonly
pkgver=0.5.3
pkgrel=1
pkgdesc="A set of Tkinter widgets for displaying readonly text and code."
arch=(any)
url="http://github.org/pybee/tkreadonly"
license=('BSD')
depends=('python2')
optdepends=()
makedepends=()
provides=('tkreadonly')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/t/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('39ee33c428255604c3df6c776f059bcd')

package()
{
  # Install using setup.py
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
