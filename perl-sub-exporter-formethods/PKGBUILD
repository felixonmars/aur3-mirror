# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-sub-exporter-formethods'
pkgver='0.100051'
pkgrel='1'
pkgdesc="helper routines for using Sub::Exporter to build methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter>=0.978' 'perl-sub-name>=0' 'perl-namespace-autoclean>=0')
makedepends=()
url='http://search.cpan.org/dist/Sub-Exporter-ForMethods'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Sub-Exporter-ForMethods-0.100051.tar.gz')
md5sums=('30612b05a2a3e9a2c31174daa858befb')
sha512sums=('bb51759b5f3b4954427242481afcb33ab335a74119d0c821c706b0bd012e9ef80e8d8aa56fd82113fc1674ede6b054860c221e3bbae79eae85a9bf4b5a7697bc')
_distdir="Sub-Exporter-ForMethods-0.100051"

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
