# Contributor: Andrew Mahone <andrew dot mahone at gmail dot com>
# Contributor: ValdikSS <iam at valdikss dot org dot ru>

pkgname=umc
pkgver=0.2
pkgrel=2
pkgdesc="A modeline calculator implementing the Coordinated Video Timing and General Timing Formula VESA standards."
arch=(i686 x86_64)
url="http://umc.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
md5sums=('2da692d7fa34678101730cbff9476ada')
