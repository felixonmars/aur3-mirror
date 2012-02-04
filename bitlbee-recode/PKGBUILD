# Contributor: dimaka <dimaka@root.ua>
# Maintainer: simo <simo@archlinux.org>
pkgname=bitlbee-recode
pkgver=1.2.3
pkgrel=1
pkgdesc="An IRC to IM gateway. Supports MSN, ICQ, Jabber, Yahoo!, and AIM. Build with oscar-recode patch, to support cyrillic in conversations with Windows users via ICQ."
arch=(i686 x86_64)
url="http://www.bitlbee.org/" 
license="GPL"
conflicts=('bitlbee')
provides=('bitlbee')
depends=('gnutls>=2.4.1' 'glib2>=2.12.4' 'xinetd')
install=bitlbee.install
backup=(etc/bitlbee/bitlbee.conf etc/bitlbee/motd.txt etc/xinetd.d/bitlbee)
source=(http://get.bitlbee.org/src/bitlbee-$pkgver.tar.gz bitlbee.xinetd bitlbee-recode-0.6.3.patch)
md5sums=('2b1674d98804970809de3da3edf0bed2'
         '81e576369e31377f5217e636b00874b1'
	 'b1a13e2863245f609d076752627acfc4')

build() {
  patch -Np0 -i $startdir/bitlbee-recode-0.6.3.patch
  cd $startdir/src/bitlbee-$pkgver
  ./configure --prefix=/usr --ssl=gnutls --etcdir=/etc/bitlbee || return 1
  make || return 1
  install -m755 -d $startdir/pkg/var/lib || return 1
  install -o65 -g65 -d -m0770 $startdir/pkg/var/lib/bitlbee
  install -D -m644 $startdir/src/bitlbee.xinetd \
                   $startdir/pkg/etc/xinetd.d/bitlbee || return 1
  make DESTDIR=$startdir/pkg install || return 1
  make DESTDIR=$startdir/pkg install-etc || return 1
}
