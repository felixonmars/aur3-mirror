# Contributor: Pranay Kanwar <warl0ck@metaeye.org>

pkgname=sing
pkgver=1.1
pkgrel=1
pkgdesc="Send nasty ICMP garbage."
url="http://sing.sourceforge.net"
license="GPL"
arch=(i686)

source=(http://downloads.sourceforge.net/sourceforge/sing/SING-$pkgver.tgz)
md5sums=('f9f649c4b40174a983601d46e4a3daac')

build() {
  cd $startdir/src/SING-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
