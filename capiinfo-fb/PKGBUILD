# Contributor: Enno Lohmeier <e.lohmeier@gmx.de>
pkgname=capiinfo-fb
pkgver=0.6
pkgrel=1
pkgdesc="Capiinfo-Tool for usage with an AVM FritzBox Fon over TCP"
arch=(i686 x86_64)
url="http://capifax.v3v.de"
license=('GPL')
depends=(libcapi20-fb)
source=(http://capifax.v3v.de/dl/libcapi20_fb-$pkgver.tar.gz)
md5sums=(a9c64ecca80c8a91ce206e2f39aacd7e)

build() {
  cd "$srcdir/capiotcp_client/capiinfo/src"

  chmod +x configure
  ./configure
  make || return 1
  mkdir -p $pkgdir/usr/bin
  cp capiinfo $pkgdir/usr/bin
}
