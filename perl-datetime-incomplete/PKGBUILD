# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-datetime-incomplete'
pkgver='0.07'
pkgrel='1'
pkgdesc="Incomplete DateTime objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0' 'perl-datetime-event-recurrence>=0' 'perl-datetime-set>=0.1401')
makedepends=()
url='https://metacpan.org/release/DateTime-Incomplete'
source=('http://search.cpan.org/CPAN/authors/id/F/FG/FGLOCK/DateTime-Incomplete-0.07.tar.gz')
md5sums=('9e6f102ecdadeb8d066caa8a109225ed')
sha512sums=('da29f6e96a30d98d1a2ddf7c60edee70f420db8351a60aa56de067b016b40994033f6413c9ed8ae4ea8b061c24c1a1d3cbabfce2ca13df86ea1cc1e31e67e040')
_distdir="DateTime-Incomplete-0.07"

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
