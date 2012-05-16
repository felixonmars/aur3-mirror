pkgname=psearch
pkgver=1.1
pkgrel=9
_pkgrel=7
pkgdesc="Python module with accompanying script to access pacman database information. Includes AUR support."
arch=('i686' 'x86_64')
url=('http://www.freshcheese.net/~wrythe/psearch')
license="GPL"
depends=('python2')
source=(http://www.freshcheese.net/~wrythe/psearch/source/psearch-${pkgver}-${_pkgrel}.tar.gz)
md5sums=('f5e8d6c68cdfe59373faae9b280ab819')

package() {
  cd "$srcdir/psearch-$pkgver-${_pkgrel}"
  sed -i -e 's#python$#python2#' $(find . -name psearch)

  python2 setup.py install --root="$pkgdir"

  install -D -m755 psearch "$pkgdir/usr/bin/psearch"
  install -D -m644 psearch.1 "$pkgdir/usr/man/man1/psearch.1"
}
