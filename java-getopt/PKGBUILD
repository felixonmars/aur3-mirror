# Contributor: xduugu
# Contributor: Frédéric Fauberteau <frederic@fauberteau.org>
pkgname=java-getopt
pkgver=1.0.14
pkgrel=1
pkgdesc="a Java command line option parser compatible with glibc's GNU getopt"
arch=('any')
url="http://www.urbanophile.com/arenn/hacking/download.html"
license=('GPL')
depends=('java-runtime')
source=(http://www.urbanophile.com/arenn/hacking/getopt/$pkgname-$pkgver.jar)
noextract=($pkgname-$pkgver.jar)
md5sums=('19da23b8e33e1209895e4e085bbb6818')
sha256sums=('8c030dfda2a03d045d5d2620ea35342d4689ce38987ed6ada7b88b9d7c874bc2')

package() {
  install -D -m 644 "$srcdir/$pkgname-$pkgver.jar" \
    "$pkgdir/usr/share/java/$pkgname/$pkgname-$pkgver.jar"
  ln -s "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
}

# vim:set ts=2 sw=2 et:
