# Maintainer : Konrad Borowski <glitchmr@myopera.com>
# Contributor: Weirch Sodora <sodora@gmail.com>

pkgname=perl-file-temp
pkgver=0.23
pkgrel=1
pkgdesc="File::Temp - return name and handle of a temporary file safely"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~tjenness/File-Temp/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/T/TJ/TJENNESS/File-Temp-$pkgver.tar.gz)
md5sums=('0db571dc413db53c5bcbba41e3c3cadc')

build() {
  cd "${srcdir}/"*"-${pkgver}"
 
 # Setting these env variables overwrites any command-line-options we don't want...
 export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
   PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
   PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
   PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
   MODULEBUILDRC=/dev/null

 { /usr/bin/perl Build.PL &&
   ./Build &&
   ./Build test &&
   ./Build install; } || return 1

 # remove perllocal.pod and .packlist
 find "$pkgdir" -name .packlist -o -name perllocal.pod -delete 
}
