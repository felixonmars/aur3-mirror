# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-extutils-manifest'
pkgver='1.61'
pkgrel='1'
pkgdesc="Utilities for managing MANIFEST files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/ExtUtils-Manifest'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/ExtUtils-Manifest-1.61.tar.gz')
md5sums=('8d72d056722a9424e642aa0e66b6b50b')
sha512sums=('5cffa866febce86d4581b481bcef7b4893fe2d5de8aaf62d24d58f1534cf0eed0fef1ac7529f9fb2818ff1176a440d053661c671359e119c714bd04d3df23ef4')
_distdir="ExtUtils-Manifest-1.61"

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
