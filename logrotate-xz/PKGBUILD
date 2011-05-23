# $Id$
# Contributor: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)
# Credits: Aaron Griffin <aaron@archlinux.org>, Judd Vinet <jvinet@zeroflux.org>
# Maintainer: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)

pkgname=logrotate-xz
_realname=logrotate
pkgver=3.7.9
pkgrel=1
pkgdesc="Rotates system logs automatically"
url=https://fedorahosted.org/logrotate/
arch=('i686' 'x86_64')
license=('GPL')
groups=('base')
depends=('cron' 'popt' 'sh' 'xz-utils')
optdepends=('logwatch: for reporting log analysis')
conflicts=(${_realname})
provides=(${_realname} ${_realname})
backup=('etc/logrotate.conf')
source=(https://fedorahosted.org/releases/l/o/logrotate/logrotate-${pkgver}.tar.gz
	http://anu.homelinux.net/pub/Linux/ports/distfiles/logrotate-xz.seq
	http://anu.homelinux.net/pub/Linux/ports/distfiles/logrotate-xz.tar.gz
	'etc_cron.daily_logrotate' 'etc_logrotate.conf')

build() {
    cd $srcdir/${_realname}-${pkgver}
    msg "Patching sources..."
    cat $srcdir/logrotate-xz.seq |while read p; do
	msg2 "Applying patch src/$p ..."
	patch -sp1 < $srcdir/$p
    done
    sed -i "s|CFLAGS = -Wall|CFLAGS = -Wall $CFLAGS|" Makefile
    sed -i 's|$(BASEDIR)/man|$(BASEDIR)/share/man|' Makefile

    msg "Running make; make install..."
    make || return 1
    make PREFIX=$pkgdir install

    msg "Making it nice..."
    install -Dm644 $srcdir/etc_logrotate.conf $pkgdir/etc/logrotate.conf
    install -Dm744 $srcdir/etc_cron.daily_logrotate $pkgdir/etc/cron.daily/logrotate
}

# vim:set ts=4 sw=4 et:
md5sums=('eeba9dbca62a9210236f4b83195e4ea5'
         '341626a7d97d091d2d36e516bf47519f'
         'f10ec49ff0e1d5aa2acd0794da2fae57'
         'd2281ecb6f898b446ac8a5984ab5a243'
         '7124c2ed09e186de19aa243e8768e485')
