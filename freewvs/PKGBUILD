pkgname=freewvs
pkgver=0.1
pkgrel=3
pkgdesc="A tool to search webroots for know vulnerable versions of web applications"
arch=('i686' 'x86_64')
url="http://source.schokokeks.org/freewvs/"
license=('GPL')
source=(http://source.schokokeks.org/freewvs/freewvs-0.1.tar.bz2)
md5sums=('878057eefc3b081dfa68944923c31aaa')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
