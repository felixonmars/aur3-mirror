# Contributor: Pranay Kanwar <warl0ck@metaeye.org>

pkgname=ipaudit
pkgver=1.0BETA2
pkgrel=1
pkgdesc="IPAudit monitors network activity on a network."
url="http://ipaudit.sourceforge.net"
depends=('libpcap')
arch=(i686)
license='GPL'
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('cd25f4de0a6428750ef18f32647d24e9')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
