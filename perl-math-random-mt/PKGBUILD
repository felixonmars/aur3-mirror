# Maintainer: Filip Gralinski <filip@amu.edu.pl>
pkgname=perl-math-random-mt
_realname=Math-Random-MT
pkgver=1.16
pkgrel=1
pkgdesc="Perl/CPAN Module Math::Random::MT : The Mersenne Twister PRNG"
arch=('any')
url="http://search.cpan.org/dist/${_realname}/"
license=('BSD')
depends=('perl>=5.10.0')
makedepends=('perl-test-number-delta')
source=("http://www.cpan.org/authors/id/F/FA/FANGLY/${_realname}-${pkgver}.tar.gz")
md5sums=('9e4246354e17685e09e90b2093b4b60d')
options=('!emptydirs')

build() {
  cd "${_realname}-${pkgver}"

 # Setting these env variables overwrites any command-line options we don't want...
 export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
   PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
   PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
   PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
   MODULEBUILDRC=/dev/null

 # If using Makefile.PL
 { /usr/bin/perl Makefile.PL &&
   make &&
   make test &&
   make install; } || return 1

 # remove perllocal.pod and .packlist
 find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
