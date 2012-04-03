# Maintainer: fnord0 <fnord0 AT riseup DOT net>

pkgname=perl-net-whois-ip
pkgver=1.10
pkgrel=1
pkgdesc="Perl extension for looking up the whois information for ip addresses"
arch=(any)
url="http://search.cpan.org/dist/Net-Whois-IP"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/B/BS/BSCHMITZ/Net-Whois-IP-$pkgver.tar.gz)
md5sums=('67edb62a49801464e0b4c6049cfbdfc4')
sha1sums=('fdc0521c883d57a8ecc31c9ba97577a4c6776505')

build() {
	     
  cd  ${srcdir}/Net-Whois-IP-${pkgver}
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  perl Makefile.PL &&
   make &&
   make test &&
   make install || return 1
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
