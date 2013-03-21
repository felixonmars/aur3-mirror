# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
pypkgletter=e
pypkgname=easydict
pkgname=python2-$pypkgname
pkgver=1.4
pkgrel=1
pkgdesc="Access dict values as attributes (works recursively)"
arch=('any')
url="https://github.com/makinacorpus/easydict"
license=('GPL')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/$pypkgletter/$pypkgname/$pypkgname-$pkgver.tar.gz")
md5sums=('349dd4050d5dc217cff12536648d88d0')

package() {
  cd "$srcdir/$pypkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
