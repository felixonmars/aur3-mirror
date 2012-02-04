# Contributor: Alberto Rodriguez <hotgalan@gmail.com>

pkgname=slony1
pkgver=2.0.7
pkgrel=1
pkgdesc="Master to multiple slaves replication system for PostgreSQL Mayor Version 2"
url="http://www.slony.info"
arch=('i686' 'x86_64')
license=('BSD')
depends=('postgresql>=8.0.0' 'postgresql-libs>=8.0.0' 'perl-dbi' 'perl-dbd-pg')
install="$pkgname.install"
source=(http://main.slony.info/downloads/2.0/source/${pkgname}-${pkgver}.tar.bz2
        'slon'
	'slon-conf.d'
	'slony1.install')
md5sums=('e8aadfa9c1115f5ce43079381a4b51b5'
         'be9c7d34cb14cd081b764731fa556cd5'
         '7d055268e38b3433402b4318b602477f'
         '6c0717f3a0ce52f0536aac1156a5bc55')

build() {
    cd $startdir/src/$pkgname-$pkgver || return 1

    ./configure --prefix=/usr --with-pgconfigdir=/usr/bin --with-perltools || return 1
    make all || return 1

    make DESTDIR=${startdir}/pkg install || return 1

    mkdir -m 0755 -p $startdir/pkg/etc/conf.d || return 1
    mkdir -m 0755 -p $startdir/pkg/etc/rc.d || return 1
    install -m 644 $startdir/slon-conf.d $startdir/pkg/etc/conf.d/slon || return 1
    install -m 755 $startdir/slon $startdir/pkg/etc/rc.d/slon || return 1    mk

    # we have to move the conf file to conform to package guidelines
    mv $startdir/pkg/usr/etc/slon_tools.conf-sample $startdir/pkg/etc/ || return 1
    rmdir $startdir/pkg/usr/etc || return 1
}
