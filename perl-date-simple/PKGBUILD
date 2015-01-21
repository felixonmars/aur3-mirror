# Contributor: Andreas dot Wagner at em dot uni-frankfurt dot de

pkgname='perl-date-simple'
_perlname='Date-Simple'
pkgver='3.03'
pkgrel='2'
pkgdesc="A simple date object"
arch=('any')
url='http://search.cpan.org/~izut/Date-Simple-3.03/lib/Date/Simple.pm'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/I/IZ/IZUT/${_perlname}-${pkgver}.tar.gz")

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/${_perlname}-${pkgver}"
  perl Makefile.PL
  make
}

test(){
  cd "${srcdir}/${_perlname}-${pkgver}"
  make test
}

package() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/${_perlname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

md5sums=('436049dc2c7dfd8423d8bcc807248b31')
