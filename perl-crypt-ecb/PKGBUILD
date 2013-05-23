pkgname='perl-crypt-ecb'
pkgver='1.45'
pkgrel='1'
pkgdesc="Crypt::ECB - Encrypt Data using ECB Mode"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/perldoc?Crypt%3A%3AECB'
source=("http://search.cpan.org/CPAN/authors/id/A/AP/APPEL/Crypt-ECB-{$pkgver}.tar.gz")
md5sums=('c0eb6e86045c1145fbc7867a84e2dcdd')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/Crypt-ECB-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/Crypt-ECB-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/Crypt-ECB-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
