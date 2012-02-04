# Contributor: Sebastian Köhler <sebkoehler@whoami.org.uk>
# Generator  : CPANPLUS::Dist::Arch 0.20
pkgname='perl-sub-install'
pkgver='0.925'
pkgrel='2'
pkgdesc="install subroutines into packages easily"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Sub-Install'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Sub-Install-0.925.tar.gz')
md5sums=('694aaec771c42280746a9a6279683263')

build() {
  DIST_DIR="${srcdir}/Sub-Install-0.925"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
