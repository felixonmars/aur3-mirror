# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.12

pkgname='perl-test-file-contents'
pkgver='0.20'
pkgrel='1'
pkgdesc="Test routines for examining the contents of files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-text-diff>=0.35')
makedepends=()
url='http://search.cpan.org/dist/Test-File-Contents'
source=('http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/Test-File-Contents-0.20.tar.gz')
md5sums=('b4ed786c03ca5ccaf694b41a1e98d85f')
_distdir="${srcdir}/Test-File-Contents-0.20"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd Test-File-Contents-0.20
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd Test-File-Contents-0.20
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd Test-File-Contents-0.20
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
