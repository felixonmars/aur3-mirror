# Maintainer: TDY <tdy@archlinux.info>

pkgname=whatsup
pkgver=1.14
pkgrel=1
pkgdesc="A cluster node up/down detection utility"
arch=('i686' 'x86_64')
url="https://computing.llnl.gov/linux/whatsup.html"
license=('GPL')
depends=('perl')
makedepends=('chrpath')
provides=('pingd')
optdepends=('ganglia: a backend alternative to the bundled pingd'
            'cerebro: a backend alternative to the bundled pingd')
options=('!libtool' '!emptydirs')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        pingd.rc
        pingd.service)
md5sums=('dbcd8f290a892a3a2718a9026870d147'
         '4a2195330132777f2ec615ccbad44988'
         '42fef231bc53e4826b04f004808ab2b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/init\.d//' etc/Makefile.in
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm755 ../pingd.rc "$pkgdir/etc/rc.d/pingd"
  install -Dm644 ../pingd.service "$pkgdir/usr/lib/systemd/system/pingd.service"
  chrpath -d "$pkgdir/usr/lib/perl5/vendor_perl/auto/Libnodeupdown/Libnodeupdown.so"
}

# vim:set ts=2 sw=2 et:
