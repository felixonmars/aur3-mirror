# Maintainer : Simon Hollingshead <me at [firstnamelastname] dot com>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-archive-tar'
pkgver='1.92'
pkgrel='2'
pkgdesc="Read, write and manipulate tar files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Archive-Tar'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/Archive-Tar-1.92.tar.gz')
md5sums=('8d24ebfc08dbe908d5b0192e4f6459dc')
sha512sums=('a14fd9f306c6c9ed202a5dcfa4eed2b4fb1eb9b480479ced07d6cadd8500139ab6a0a194a9cca06f41c3a35f3e7df736326c54153d016f2459a72e61fffc91ef')
_distdir="Archive-Tar-1.92"

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
