# Contributor: Andre Ericson <de.ericson@gmail.com>

pkgname=dconf-search
pkgver=0.1
pkgrel=1
pkgdesc="A tool to search for dconf entries"
arch=(any)
url="https://github.com/aericson/dconf-search"
license=('MIT')
depends=('python2-tinydconf')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=(https://github.com/downloads/aericson/dconf-search/$pkgname-$pkgver.tar.gz)
md5sums=('3933cd2b03446832b3cc68ef1b1ffef5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
