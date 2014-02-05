# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-cpanplus'
pkgver='0.9148'
pkgrel='1'
pkgdesc="Ameliorated interface to the CPAN"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/CPANPLUS'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/CPANPLUS-0.9148.tar.gz')
md5sums=('e135aab8af0f16e07ddf1fe096680a00')
sha512sums=('321675021f07c440c835c8cd4a074e72257b29b62c2e72367ead7d4005194f6b1fa48198aa3e7bceabf47b0df79f50800ed464da4aa11fe53686a1ddc8112539')
_distdir="CPANPLUS-0.9148"

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
