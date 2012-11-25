# Maintainer: SJ_UnderWater
# Based on netatalk package :
# Maintainer: Dominik Dingel <mail at wodar dot de>
# Contributor: William Udovich <nerdzrule7 at earthlink dot net>
# Contributor: Farhan Yousaf <farhany at xaviya dot com>

pkgbase=netatalk
pkgname=netatalk-ddp
pkgver=2.2.4
pkgrel=2
pkgdesc='A kernel-level implementation of AppleTalk, AFP, and PAP services'
arch=('i686' 'x86_64')
url='http://netatalk.sourceforge.net'
license=('GPL')
depends=('openslp' 'libcups' 'libgcrypt>=1.2.3')
optdepends=('cups: required for PAP support')
replaces=('netatalk-git' 'netatalk2')
conflicts=('netatalk')
backup=('etc/netatalk/afpd.conf'
	'etc/netatalk/afp_ldap.conf'
	'etc/netatalk/netatalk.conf'
	'etc/netatalk/AppleVolumes.default'
	'etc/netatalk/AppleVolumes.system'
	'etc/netatalk/atalkd.conf'
	'etc/netatalk/papd.conf'
	'etc/pam.d/netatalk')
options=('!libtool')
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://hivelocity.dl.sourceforge.net/project/$pkgbase/$pkgbase/$pkgver/$pkgbase-$pkgver.tar.bz2)
md5sums=('40753a32340c24e4ec395aeb55ef056e')

build() {
	cd $pkgbase-$pkgver
	msg2 'Fixing...'
	sed -i 's/#include <ctype.h>/#define _IPP_PRIVATE_STRUCTURES 1\n#include <ctype.h>/' etc/papd/print_cups.c
	sed -i 's/#include <unistd.h>/#include <stdlib.h>\n#include <unistd.h>/' contrib/a2boot/a2boot.c
	sed -i 's:/lib:/usr/lib:' distrib/initscripts/Makefile.{am,in}
	msg2 'Configuring...'
	CFLAGS="-Wno-unused-result" ./configure --prefix=/usr --localstatedir=/var --libexecdir='${libdir}' \
		--with-cracklib --with-cnid-cdb-backend --enable-systemd --enable-fhs --enable-ddp --enable-srvloc --enable-timelord --enable-cups --enable-a2boot
	msg2 'Making...'
	make >/dev/null
}
package() {
	cd $pkgbase-$pkgver
	msg2 'Building...'
	make DESTDIR="$pkgdir" install >/dev/null
	msg2 'Moving Files...'
	rm "$pkgdir"/usr/include/netatalk/at.h
}
