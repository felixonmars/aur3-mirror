# Maintainer: Gerad Munsch <gmunsch@unforgivendevelopment.com>

## BUILT FROM 'network-ups-tools' PKGBUILD -- original maintainers:
# Maintainer: Alex Reznichenko <sa5gap@yandex.ru>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Giuseppe Lucarelli <luk@rebelsoft.org>

pkgname=network-ups-tools-full
pkgver=2.6.5
pkgrel=5
pkgdesc="NUT is a collection of programs for monitoring and administering UPS hardware (with SNMP, development files, avahi, logrotate, and bash completion support)"
arch=('i686' 'x86_64')
url="http://www.networkupstools.org/"
license=('GPL2')
depends=('openssl' 'libusb-compat' 'net-snmp')
optdepends=('avahi' 'logrotate')
makedepends=('avahi' 'logrotate')
conflicts=('network-ups-tools')
replaces=('network-ups-tools')
provides=('network-ups-tools')
backup=(etc/ups/{ups.conf,upsd.conf,upsd.users,upsmon.conf,upssched.conf})
install=nut.install
source=("http://www.networkupstools.org/source/2.6/nut-$pkgver.tar.gz"
		'upsd.init')
options=('!emptydirs' '!libtool')
md5sums=('e6eac4fa04baff0d0a827d64efe81a7e'
         '089ea4a56552253328d17603ff5670cc')

build() {

  cd $srcdir/nut-$pkgver
  ./configure \
    --without-wrap \
    --with-user=ups \
    --with-group=nut \
    --with-usb \
    --with-snmp \
    --with-dev \
    --with-avahi \
    --prefix=/usr \
    --with-udev-dir=/usr/lib/udev \
    --with-systemdsystemunitdir=/lib/systemd/system \
    --datadir=/usr/share/ups \
    --includedir=/usr/include/network-ups-tools \
    --sbindir=/usr/bin \
    --with-drvpath=/usr/bin \
    --with-pkgconfig-dir=/usr/lib/pkgconfig \
    --sysconfdir=/etc/ups || return 1

  make || return 1

}

package() {

  cd $srcdir/nut-$pkgver
  make DESTDIR=$pkgdir install || return 1

  install -D -m755 $startdir/upsd.init $pkgdir/etc/rc.d/upsd || return 1
  install -D -m644 conf/ups.conf.sample $pkgdir/etc/ups/ups.conf
  install -D -m640 conf/upsd.conf.sample $pkgdir/etc/ups/upsd.conf
  install -D -m640 conf/upsd.users.sample $pkgdir/etc/ups/upsd.users
  install -D -m640 conf/upsmon.conf.sample $pkgdir/etc/ups/upsmon.conf
  install -D -m644 conf/upssched.conf.sample $pkgdir/etc/ups/upssched.conf
  install -D -m644 scripts/avahi/nut.service $pkgdir/etc/avahi/services/network-ups-tools.service
  install -D -m644 scripts/logrotate/nutlogd $pkgdir/etc/logrotate.d/network-ups-tools
  install -D -m755 scripts/misc/nut.bash_completion $pkgdir/etc/bash_completion.d/network-ups-tools

}
