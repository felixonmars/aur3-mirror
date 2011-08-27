# Contributor: Sebastian Köhler <sebkoehler@whoami.org.uk>
# Generator  : CPANPLUS::Dist::Arch 0.20
pkgname='perl-sub-exporter'
pkgver='0.982'
pkgrel='2'
pkgdesc="a sophisticated exporter for custom-built routines"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-data-optlist>=0.1' 'perl-params-util>=0.14' 'perl-sub-install>=0.92')
url='http://search.cpan.org/dist/Sub-Exporter'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Sub-Exporter-0.982.tar.gz')
md5sums=('db90a0d73a5ca2d185dd6c6d2fc848f0')

build() {
  DIST_DIR="${srcdir}/Sub-Exporter-0.982"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
