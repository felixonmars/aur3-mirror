# Contributor: Andre Ericson <de.ericson@gmail.com>

pkgname=python2-tinydconf
pkgver=0.1
pkgrel=1
pkgdesc="A wrapper around dconf client api"
arch=('i686' 'x86_64')
url="https://github.com/aericson/tinydconf"
license=('MIT')
depends=('python2' 'dconf')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=(https://github.com/downloads/aericson/tinydconf/$pkgname-$pkgver.tar.gz)
md5sums=('845f641774216c1e4307b298c8e2f4ca')
options=(!emptydirs)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
