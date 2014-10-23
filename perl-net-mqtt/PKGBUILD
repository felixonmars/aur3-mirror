# Contributor: Endre Szabo <aur@end.re>

_dist=Net-MQTT
pkgname=perl-net-mqtt
pkgver=1.142010
pkgrel=1
pkgdesc="Perl implementation of MQTT Protocol"
arch=('any')
url="http://search.cpan.org/dist/Net-MQTT/"
license=("PerlArtistic")
depends=('perl' 'perl-module-pluggable')
source=(http://search.cpan.org/CPAN/authors/id/B/BE/BEANZ/Net-MQTT-${pkgver}.tar.gz)
md5sums=('f0dfb5e99c72c75678602ea770bd743d')

build() {
	cd "${srcdir}/${_dist}-${pkgver}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL
	make
}

check() {
	cd "${srcdir}/${_dist}-${pkgver}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make test
}


package() {
	cd "${srcdir}/${_dist}-${pkgver}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
