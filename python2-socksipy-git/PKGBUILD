# Maintainer: Francesco Marella <francesco.marella@anche.no>

pkgname=python2-socksipy-git
_gitname=PySocks
pkgver=12.3cc0e5c
pkgrel=1
pkgdesc="Routes sockets of any TCP service through a SOCKS4, SOCKS5 or HTTP proxy - Anorov fork"
arch=('any')
license=('BSD')
url="https://github.com/Anorov/PySocks"
depends=('python2')
provides=('socksipy')
conflicts=('socksipy')
makedepends=('git')
source=("git+https://github.com/Anorov/PySocks.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/"
  cp socks{,handler}.py "$pkgdir/usr/lib/python2.7/site-packages/"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"

}


