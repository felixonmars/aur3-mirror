# Maintainer: Strephil <strefil@yandex.ru>
pkgname=t6_client
pkgver=1.0
pkgrel=1
pkgdesc="Tunnel6 client."
arch=(i686)
url="http://tunnel6.zexos.org"
license=('GPL3')
depends=(iproute2)
install=
backup=('etc/tunnel6/client.conf')
source=(http://tunnel6.zexos.org/download/src/$pkgname-$pkgver-src.tar.bz2
        t6_client.install
        t6_client.rc.d)
md5sums=('deef70611ad7843010dfcf9cde527b8d'
         'e595149ca2a09627b54b5ebb51dc4fe1'
         '6ae8cacd9f89e67ead08d7fb5d6e5138')
build() {
  cd "$srcdir/$pkgname-$pkgver-src/src"

  mkdir -p $pkgdir/usr/sbin
  mkdir -p $pkgdir/etc/rc.d
  sed '/(Q)\(cp\|mkdir\|rm\|rmdir\)/s/ \([^ ]*\)$/ $(DESTDIR)\1/' -i makefile
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  chmod go-r /etc/tunnel/client.conf
  install -D -m755 $startdir/t6_client.rc.d $pkgdir/etc/rc.d/t6_client
}
