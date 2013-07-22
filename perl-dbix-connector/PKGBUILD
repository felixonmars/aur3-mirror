# Contributor: Viliam Pucik <viliam.pucik@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.15

pkgname='perl-dbix-connector'
pkgver='0.53'
pkgrel='1'
pkgdesc="Fast, safe DBI connection and transaction management"
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl>=5.6.2' 'perl-dbi>=1.605')
makedepends=('perl-test-mockmodule>=0.05' 'perl-module-build>=0.30')
url='http://search.cpan.org/dist/DBIx-Connector'
source=("http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/DBIx-Connector-${pkgver}.tar.gz")
md5sums=('127fafe4fd4da0c9c7df2ff1c8754c6d')
sha512sums=('13f11460908ea6879ff4ae15d5d4f99d14e28dc87ce626bfff08306bbf09d37d93bf6fa4ffee4bef767b6c8cec2f554a0a600d6ea838742fc065b77aafe78bed')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/DBIx-Connector-${pkgver}"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "${srcdir}/DBIx-Connector-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "${srcdir}/DBIx-Connector-${pkgver}"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
