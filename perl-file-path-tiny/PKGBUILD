# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.07
pkgname='perl-file-path-tiny'
pkgver='0.1'
pkgrel='1'
pkgdesc="recursive versions of mkdir() and rmdir() without as much overhead as File::Path"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-simple')
url='http://search.cpan.org/dist/File-Path-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/D/DM/DMUEY/File-Path-Tiny-0.1.tar.gz')
md5sums=('3a2ac2277304b6a1c017f24c8327f55a')

build() {
  PERL=/usr/bin/perl
  DIST_DIR="${srcdir}/File-Path-Tiny-0.1"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { cd "$DIST_DIR" &&
    $PERL Makefile.PL &&
    make &&
    make test &&
    make install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
