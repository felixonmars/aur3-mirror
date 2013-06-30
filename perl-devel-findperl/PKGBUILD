# Maintainer: Konrad Borowski <glitchmr@myopera.com>

pkgname=perl-devel-findperl
_realname=Devel-FindPerl
pkgver=0.006
pkgrel=1
pkgdesc="Find the path to your perl"
arch=('any')
url="http://search.cpan.org/dist/${_realname}/"
license=('GPL' 'Artistic')
depends=('perl>=5.10.0')
makedepends=(
'perl-extutils-config'
'perl-capture-tiny')
source=("http://www.cpan.org/authors/id/L/LE/LEONT/${_realname}-${pkgver}.tar.gz")
md5sums=('d2b94212dc147283a8158c1e441dfa2c')
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
