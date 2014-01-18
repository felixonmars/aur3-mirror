# Maintainer: Rich Li <rich@dranek.com>
# Contributor: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
pkgname=python2-pydns
_pkgname=pydns
pkgver=2.3.6
pkgrel=1
pkgdesc="Python module for performing DNS queries"
arch=('any')
url="http://pydns.sourceforge.net"
license=('Python')
depends=('python2')
#conflicts=('python-pydns')
options=(!emptydirs)
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('d12ca75251854ab6fcabbaff6909b690')
sha1sums=('1e0c11248071d3fac0a2d7516b1d2894388edbac')
sha256sums=('d3cf6fc4ec088e934cf2dd4d71080efdb5c09ae79cbb2512427eb0fc393f2417')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

