# Contributor: FUBAR <mrfubar@gmail.com>
# Contributor: simo <simo@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=bitlbee-otr
pkgver=1.2.8
pkgrel=2
pkgdesc="An IRC to IM gateway. Supports MSN, ICQ, Jabber, Yahoo!, and AIM"
arch=('i686' 'x86_64')
url="http://www.bitlbee.org/" 
license=('GPL')
depends=('gnutls' 'glib2')
optdepends=('xinetd: to run bitlbee through xinetd')
install=bitlbee.install
backup=(etc/bitlbee/bitlbee.conf etc/bitlbee/motd.txt etc/xinetd.d/bitlbee)
conflicts=('bitlbee')
source=(http://fbsd.zlonet.ru/distfiles/$pkgname-$pkgver.tar.bz2
	'bitlbee.xinetd'
	'bitlbee.rcd'
	'otr-background-color.diff')

build() { 
  cd $srcdir/$pkgname-$pkgver

  patch -p0 < ../../otr-background-color.diff

  ./configure --prefix=/usr \
              --ssl=gnutls \
              --etcdir=/etc/bitlbee \
              --pidfile=/var/run/bitlbee/bitlbee.pid \
              --ipcsocket=/var/run/bitlbee/bitlbee.sock || return 1
  make || return 1

  install -m755 -d $pkgdir/var/lib
  install -o65 -g65 -d -m0770 $pkgdir/var/lib/bitlbee
  install -m755 -d $pkgdir/var/run
  install -o65 -g65 -d -m755 $pkgdir/var/run/bitlbee
  install -D -m644 $srcdir/bitlbee.xinetd \
    $pkgdir/etc/xinetd.d/bitlbee
  install -D -m755 $srcdir/bitlbee.rcd \
    $pkgdir/etc/rc.d/bitlbee || return 1
  make DESTDIR=$pkgdir install || return 1
  make DESTDIR=$pkgdir install-etc || return 1
  make DESTDIR=$pkgdir install-dev || return 1
}
md5sums=('1273e7861f393473c5060f5ec5d6c214'
         '81e576369e31377f5217e636b00874b1'
         'cb76d0d1fdba8a6a8361552e7ea21507'
         '78dc5a98ce353f42b8addd561a6135fe')
