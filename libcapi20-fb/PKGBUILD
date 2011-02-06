# Contributor: Enno Lohmeier <e.lohmeier@gmx.de>
pkgname=libcapi20-fb
pkgver=0.7
pkgrel=1
pkgdesc="Capi-Lib for usage with an AVM FritzBox Fon over TCP"
arch=(i686 x86_64)
url="http://fbrcapi.v3v.de/"
license=('GPL')
provides=(capi4k-utils)
conflicts=(capi4k-utils)
replaces=(capi4k-utils)
source=(http://fbrcapi.v3v.de/dl/libcapi20_fb-$pkgver.tar.bz2)
md5sums=(c655da5416a01954aa7aadff2cd87301)

build() {
  cd "$srcdir/libcapi20_fb-0.7/"

  cp -r ./libcapi20_fb/src/* ./

  ./configure --prefix=/usr

  make || return 1
  make DESTDIR=$pkgdir install
  chmod -R 755 $pkgdir/

}
