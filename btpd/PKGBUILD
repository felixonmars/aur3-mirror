# Maintainer: Marq Schneider <queueRAM@gmail.com>

pkgname=btpd
pkgver=0.16
pkgrel=2
pkgdesc="BitTorrent client consisting of a daemon and client commands to control the daemon"
arch=('i686' 'x86_64')
url="http://github.com/btpd/btpd"
license=('custom')
depends=('openssl')
backup=('etc/conf.d/btpd')
source=(http://cloud.github.com/downloads/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz \
        btpd.rc.d
        btpd.conf.d)
md5sums=('fe042aae8d7c515ecd855673d1c2b33e'
         '4a968e0a333a1787fcec4da0dfc85fdc'
         '56036e80a9c5505865e77cee3eb01600')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m755 $srcdir/btpd.rc.d $pkgdir/etc/rc.d/btpd
  install -D -m644 $srcdir/btpd.conf.d $pkgdir/etc/conf.d/btpd
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

# vim:set ts=2 sw=2 et:
