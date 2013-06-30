# Maintainer: Konrad Borowski <glitchmr@myopera.com>

pkgname=perl-module-path
_realname=Module-Path
pkgver=0.09
pkgrel=2
pkgdesc="Get the full path to a locally installed module"
arch=('any')
url="http://search.cpan.org/dist/${_realname}/"
license=('GPL' 'Artistic')
depends=('perl>=5.10.0')
makedepends=('perl-devel-findperl')
source=("http://www.cpan.org/authors/id/N/NE/NEILB/${_realname}-${pkgver}.tar.gz")
md5sums=('9cb8023ba7aed226d6c6f0dc296077fa')
options=(!emptydirs)

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
 
 # Setting these env variables overwrites any command-line-options we don't want...
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
