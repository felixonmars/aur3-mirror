# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-poe-component-snmp'
pkgver='1.1006'
pkgrel='1'
pkgdesc="POE interface to Net::SNMP"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-net-snmp>=0' 'perl-poe>=0.31')
makedepends=()
url='http://search.cpan.org/dist/POE-Component-SNMP'
source=('http://search.cpan.org/CPAN/authors/id/R/RD/RDB/POE-Component-SNMP-1.1006.tar.gz')
md5sums=('9a2ef36ca0c40e030f0af35174a67172')
sha512sums=('d66f516421bb9d6fa34c85c393878fb43816229a738a82f316ed57952ebf9c678b0ef96abfc236b6dc6eec29fc83b9fbbfaddb5659e4b039fa6be02b7d6aee36')
_distdir="POE-Component-SNMP-1.1006"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
