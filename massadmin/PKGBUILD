# $Id$
# Maintainer: Guillaume DUMOULIN <guillaume.dumoulin@gmail.com>
# Contributor: elsixdiab

pkgname=massadmin
pkgver=2.3
pkgrel=1
pkgdesc="Parallelizes system commands on mass remote servers."
arch=('i686' 'x86_64')
url="http://massadmin.darold.net/"
license=('GPL3') 
depends=('perl-expect' 'perl-io-tty' 'perl-net-ping' 'perl-net-telnet' 'perl-proc-queue')
makedepends=('inetutils')
install=
options=(!emptydirs)
source=(http://sourceforge.net/projects/massadmin/files/${pkgver}/"${pkgname}-${pkgver}.tar.gz")
_bindir=/usr/bin/
_mandir=/usr/man/
md5sums=('6b0807146e808e8e2075da4196335af7')

build() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p ${pkgdir}/${_mandir}/man1
	# install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL DESTDIR=${pkgdir} BINDIR=${_bindir} MANDIR=${_mandir} || return 1
	make install
	# Remove .packlist and perllocal.pod files.
	find ${pkgdir} -name '.packlist' -delete
  	find ${pkgdir} -name 'perllocal.pod' -delete
}
