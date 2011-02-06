# Maintainer: Squichraar <squichraar at mail dot ru>
pkgname=gematria
pkgver=0.6
pkgrel=1
pkgdesc="Command-line utility to show hebrew/greek words gematria. Supports transliteration."
arch=('i686' 'x86_64')
url="http://gematria.sourceforge.net/"
license=('GPL')
depends=('python')
source=(http://downloads.sourceforge.net/project/gematria/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('5e80dfd6954c8ecfd4edb10ec027af02')
build() {
          install -Dm755 $srcdir/$pkgname/gematria $pkgdir/usr/bin/gematria
}

