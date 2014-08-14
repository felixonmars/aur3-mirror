# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-poe-devel-benchmarker'
pkgver='0.05'
pkgrel='1'
pkgdesc="Benchmarking POE's performance ( acts more like a smoker )"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0' 'perl-devel-hide>=0' 'perl-gdgraph>=0' 'perl-html-parser>=0' 'perl-module-pluggable>=0' 'perl-poe>=0' 'perl-poe-session-attributebased>=0' 'perl-uri>=0' 'perl-yaml-tiny>=0' 'perl-libwww>=0')
makedepends=()
url='http://search.cpan.org/dist/POE-Devel-Benchmarker'
source=('http://search.cpan.org/CPAN/authors/id/A/AP/APOCAL/POE-Devel-Benchmarker-0.05.tar.gz')
md5sums=('2dc6987854a2489a11213b7e0900016a')
sha512sums=('26e560ada97f37b38e5093c0e74920dd2cb18b429b7d1868fedd4b6675c487b51ec57875e7fcf8e43588b456598d05a29f7dfba4922307f21fd4366c248a62db')
_distdir="POE-Devel-Benchmarker-0.05"

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
