# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.24

pkgname='perl-io-html'
pkgver='1.00'
pkgrel='1'
pkgdesc="Open an HTML file with automatic charset detection"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/IO-HTML'
source=('http://search.cpan.org/CPAN/authors/id/C/CJ/CJM/IO-HTML-1.00.tar.gz')
md5sums=('fdfa3fe3d61a7fda9236c8d9776cdd65')
sha512sums=('26c718457d8bcf05f9f6b1e7f6da48557c0288cf0a63f7fcb5e6f022bc5c2f317c46056d7b07eedced252ff434a869b6b781a14344a1c60b3696acabd10dcc4b')
_distdir="${srcdir}/IO-HTML-1.00"

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
