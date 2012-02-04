# $Id: PKGBUILD,v 1.10 2007/09/17 21:42:35 simo Exp $
# Contributor: Li Changying <lchangying@gmail.com>
# Maintainer: Li Changying <lchangying@gmail.com>
pkgname=bitlbee-msn-xiaoi
pkgver=1.2
pkgrel=1
pkgdesc="An IRC to IM gateway. Supports MSN, ICQ, Jabber, Yahoo!, and AIM. Add support for showing username in msn xiaoi group."
arch=(i686 x86_64)
url="http://www.bitlbee.org/" 
license="GPL"
depends=('gnutls>=1.4.0' 'glib2' 'xinetd')
privides=('bitlbee=1.2')
conflicts=('bitlbee')
install=bitlbee.install
backup=(etc/bitlbee/bitlbee.conf etc/bitlbee/motd.txt etc/xinetd.d/bitlbee)
source=(http://get.bitlbee.org/src/bitlbee-$pkgver.tar.gz bitlbee.xinetd msn-xiaoi-patch.txt )
md5sums=('15d969391dd9bbbc9bb0d397b545a99c'
         '81e576369e31377f5217e636b00874b1'
         '4c22250635bf183cc98d21e5ef6586b9')

build() { 
  cd $startdir/src/bitlbee-$pkgver
  patch -p1 < ../msn-xiaoi-patch.txt || return 1
  ./configure --prefix=/usr --ssl=gnutls --etcdir=/etc/bitlbee
  make || return 1
  mkdir -p $startdir/pkg/var/lib
  install -o65 -g65 -d -m0770 $startdir/pkg/var/lib/bitlbee
  install -D -m644 $startdir/src/bitlbee.xinetd \
                   $startdir/pkg/etc/xinetd.d/bitlbee
  make DESTDIR=$startdir/pkg install
  make DESTDIR=$startdir/pkg install-etc
}
