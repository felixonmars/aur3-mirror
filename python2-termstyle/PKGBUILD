# Maintainer: Igor Babuschkin <ibabuschkin@gmail.com>

pkgname=python2-termstyle
pkgver=0.1.10
pkgrel=1
pkgdesc="A dirt-simple terminal-colour library for python"
arch=(any)
url="http://gfxmonk.net/dist/0install/python-termstyle.xml"
license=('BSD')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://gfxmonk.net/dist/0install/python-termstyle/python-termstyle-${pkgver}.tgz")
md5sums=('1ffe4a4fa86448f2a5fec0036ae21802')

DLAGENTS=('http::/usr/bin/wget -O %o %u')

package() {
  cd "$srcdir"
  
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
