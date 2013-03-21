# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
pypkgletter=l
pypkgname=landez
pkgver=1.7
pkgname=python2-$pypkgname$pkgver
pkgrel=1
pkgdesc="Landez is a python toolbox to manipulate map tiles."
arch=('any')
url="https://github.com/makinacorpus/landez"
license=('GPL')
groups=()
depends=('python2')
optdepends=('python2-mapnik')
makedepends=()
provides=()
conflicts=('python2-landez')
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/$pypkgletter/$pypkgname/$pypkgname-$pkgver.tar.gz")
md5sums=('8baa18f2f2d784eb6795ba4992977e39')

package() {
  cd "$srcdir/$pypkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
