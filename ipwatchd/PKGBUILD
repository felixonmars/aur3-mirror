# Maintainer: Alex Merry <dev@randomguy3.me.uk>
pkgname=ipwatchd
pkgver=1.2.1
pkgrel=1
pkgdesc="Monitors for IP address conflicts"
arch=(i686 x86_64)
url="http://ipwatchd.sourceforge.net/"
license=('GPL')
backup=(etc/ipwatchd.conf)
depends=(libpcap libnet)
optdepends=('ipwatchd-gnotify: provide conflict notifications to the GNOME desktop environment')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
        ipwatchd.service)
md5sums=('a54f5b815cb98d4e17770cad7ff42679'
         '6526999673c5a26153dbbf0681c50e1b')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"

  make DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/etc/init.d"

  install -m755 -d "$pkgdir/usr/lib/systemd/system"
  install -m644 "$srcdir/ipwatchd.service" "$pkgdir/usr/lib/systemd/system/"
}

# vim:set ts=2 sw=2 et:
