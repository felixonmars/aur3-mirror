# Contributor: post <postwannabe@gmail.com>
pkgname=tsocks-patched
pkgver=1.8.3
pkgrel=1
pkgdesc="tsocks with various patches (safe to use with Tor)"
arch=(i686 x86_64)
url="http://giig.ugr.es/~rgarcia/tsocks/"
license="GPL"
depends=('glibc')
conflicts=(tsocks)
source=("http://giig.ugr.es/~rgarcia/tsocks/tsocks-$pkgver.tar.bz2")
md5sums=('42eafd7fe0ee08cb27bb3228295fb36c')

build() {
  cd $startdir/src/tsocks-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  mv $startdir/pkg/lib $startdir/pkg/usr
}
