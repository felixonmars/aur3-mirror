# Maintainer: Alexander Duscheleit <jinks@archlinux.us>
pkgname=kyotocabinet-java
pkgver=1.24
pkgrel=1
pkgdesc="Java bindings for Kyoto Cabinet."
arch=('i686' 'x86_64')
url="http://fallabs.com/kyotocabinet/"
license=('GPL3')
depends=('kyotocabinet>=1.2.34' 'java-environment')
source=(http://fallabs.com/kyotocabinet/javapkg/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR="$pkgdir/"
  install -d -m755 "$pkgdir/usr/share/java/$pkgname"
  mv "$pkgdir/usr/lib/kyotocabinet.jar" "$pkgdir/usr/share/java/$pkgname/"
}

# vim:set ts=2 sw=2 et:
sha512sums=('62cc01ead05da12f2964251c77581af88cd7ca2ae1cd27da21d301468324062d3af45b6fd38abcb81cad94a22a6c58299edcf4d9e9fdcfdfc854aca3f12bf633')
