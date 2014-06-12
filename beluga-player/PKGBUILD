# Maintainer: Vivien Didelot <vivien+aur@didelot.org>
pkgname=beluga-player
pkgver=0.8
pkgrel=1
pkgdesc='A cross-platform Pandora (pandora.com) player'
arch=('any')
url='http://jbonjean.github.io/beluga-player'
license=('GPL3')
depends=('java-runtime')
source=("https://github.com/jbonjean/beluga-player/releases/download/$pkgver/$pkgname-$pkgver.jar"
        "$pkgname.sh")
noextract=($pkgname-$pkgver.jar)
md5sums=('9b784d6621ee108bfeb9de10c08e69c5'
         '9895cd1626fc464ac79cabe175250407')

package () {
  install -D -m 644 "$srcdir/$pkgname-$pkgver.jar" "$pkgdir/usr/lib/$pkgname/$pkgname.jar"
  install -D -m 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

# vim: et ts=2 sw=2
