# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-parse-win32registry'
pkgver='0.60'
pkgrel='1'
pkgdesc="Parse Windows Registry Files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Parse-Win32Registry'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMACFARLA/Parse-Win32Registry-0.60.tar.gz')
md5sums=('7a18aa35583cccca69666ad12436a714')
sha512sums=('2706fcc0ca7e04e26decce2f0b1260467466bef99fe718df9e6acf00b9ebaf544f147b1a2977305c87f0379b3cf8a1e6574b3a83a05f05cc8f22cf4a962710f7')
_distdir="${srcdir}/Parse-Win32Registry-0.60"

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
