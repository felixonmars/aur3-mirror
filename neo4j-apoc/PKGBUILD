# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=neo4j-apoc
pkgver=1.1
pkgrel=1
pkgdesc="Embedded, disk-based, fully transactional Java graph database (binaries)"
arch=(any)
url="http://neo4j.org/"
license=('custom')
depends=(java-runtime)
source=(http://dist.neo4j.org/$pkgname-$pkgver.tar.gz
        $pkgname.sh)
md5sums=('3b190b96aa3680cbb1ca723a5faec280'
         '36817f726b08653dd5f7f1d88828027b')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/opt" "$pkgdir/usr/share/licenses/$pkgname"
  install -D "../$pkgname.sh" "$pkgdir/etc/profile.d/$pkgname.sh"
  cp -r . "$pkgdir/opt/$pkgname"
  mv "$pkgdir/opt/$pkgname/"{LICENSE,NOTICE}.txt "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
