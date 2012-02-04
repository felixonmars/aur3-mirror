# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.15

pkgname='perl-html-table'
pkgver='2.08'
pkgrel='1'
pkgdesc="produces HTML tables"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/HTML-Table'
source=('http://search.cpan.org/CPAN/authors/id/A/AJ/AJPEACOCK/HTML-Table-2.08a.tar.gz')
md5sums=('ae24eb86442e34d9ef6c8f3e4deac968')
_distdir="${srcdir}/HTML-Table-2.08a"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
