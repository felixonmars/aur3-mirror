# $Id$
# Maintainer: Jan Misiak <fijam [at] archlinux.us>
# Based off PKGBUILD in extra by  Dale Blount <dale@archlinux.org>
# Original Contributor: Tom Newsom <Jeepster@gmx.co.uk>


pkgname=john-devel
pkgver=1.7.3.4
pkgrel=1
pkgdesc="John the Ripper is a fast password cracker. Development version with Jumbo patchset appplied."
arch=('i686' 'x86_64')
url="http://www.openwall.com/john/"
license=('GPL2')
depends=('openssl')
provides=('john')
source=(ftp://ftp.openwall.com/john/$pkgver/john-$pkgver.tar.gz \
	http://www.openwall.com/john/contrib/john-$pkgver-jumbo-1.diff.gz \
	ftp://ftp.kfki.hu/pub/packages/security/ssh/ossh/libdes-4.04b.tar.gz \
	params.h.patch)
md5sums=('b8055b53076691add77a717721e8b170'
         '337fecc7275a5dc9e4b103c0233b0518'
         'c8d5c69f86c2eedb485583b0305284a1'
         'f69ed632eba8fb9e45847a4b4a323787')

build() {
	# jumbo patch
	cd ${srcdir}
	patch -p0 < ${srcdir}/john-$pkgver-jumbo-1.diff || return 1
	cd ${srcdir}/john-$pkgver/src/

	# patch default params
	patch -p0 < ${srcdir}/params.h.patch || return 1
	if [ "$CARCH" == "x86_64" ]; then
	    sed -i 's|CFLAGS = -c -Wall -O2|CFLAGS = -c -Wall -O2 -march=x86-64 -DJOHN_SYSTEMWIDE=1|' Makefile || return 1
	    sed -i 's|^LDFLAGS =\(.*\)|LDFLAGS =\1 -lm|' Makefile || return 1
	    sed -i -e 's|-m486||g' Makefile || return 1
	  else sed -i 's|CFLAGS = -c -Wall -O2|CFLAGS = -c -Wall -O2 -march=i686 -DJOHN_SYSTEMWIDE=1|' Makefile || return 1
	fi
	sed -i 's|LIBS = -ldes|LIBS = -ldes -Ldes|' Makefile || return 1
	sed -i 's|#include <des.h>|#include "des/des.h"|' KRB5_fmt.c || return 1
	sed -i 's|#include <des.h>|#include "des/des.h"|' KRB5_std.h || return 1

	# build john
	if [ "$CARCH" == "x86_64" ]; then
	    make linux-x86-64 || return 1
	  else make linux-x86-mmx || return 1
	fi

	# config file
	install -d ${pkgdir}/etc/john
	sed -i 's|$JOHN|/usr/share/john|g' ${srcdir}/john-$pkgver/run/john.conf || return 1
	install -m644 ${srcdir}/john-$pkgver/run/john.conf ${pkgdir}/etc/john/john.conf
	
	# docs
	install -d ${pkgdir}/usr/share/doc/john
	install -m644 ${srcdir}/john-$pkgver/doc/* ${pkgdir}/usr/share/doc/john

	# password lists, charset and stats files
	install -d ${pkgdir}/usr/share/john/
	install -m644 ${srcdir}/john-${pkgver}/run/{{all,alnum,alpha,digits,lanman}.chr,password.lst,stats} ${pkgdir}/usr/share/john/ || return 1

	# install binaries
	install -d ${pkgdir}/usr/bin
	if [ "$CARCH" == "x86_64" ]; then
	    make linux-x86-64 || return 1
	  else 	make linux-x86-mmx || return 1
	fi
	install -m755 ${srcdir}/john-$pkgver/run/john ${pkgdir}/usr/bin/john
	install -m755 ${srcdir}/john-$pkgver/run/mailer ${pkgdir}/usr/bin/john-mailer


	#install jumbo binaries
	install -d ${pkgdir}/usr/sbin
	install -m755 ${srcdir}/john-$pkgver/run/genmkvpwd ${pkgdir}/usr/sbin/genmkvpwd
	install -m755 ${srcdir}/john-$pkgver/run/calc_stat ${pkgdir}/usr/sbin/calc_stat
	install -m755 ${srcdir}/john-$pkgver/run/mkvcalcproba ${pkgdir}/usr/sbin/mkvcalcproba

	#symlink
	cd ${pkgdir}/usr/bin
	ln -s john unafs
	ln -s john unique
	ln -s john unshadow
	ln -s john undrop
}

