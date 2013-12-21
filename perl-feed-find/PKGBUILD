# Contributor: Joe Carta <cartakid at gmail dot com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-feed-find'
pkgver='0.07'
pkgrel='1'
pkgdesc="Syndication feed auto-discovery"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-errorhandler>=0' 'perl-html-parser>=0' 'perl-uri>=0' 'perl-libwww>=0' 'perl>=5.8.1')
makedepends=()
url='http://search.cpan.org/dist/Feed-Find'
source=('http://search.cpan.org/CPAN/authors/id/B/BT/BTROTT/Feed-Find-0.07.tar.gz')
md5sums=('9235e3ca061d0beb9cf23cb579522669')
sha512sums=('5ae62c0d5380d00bfae9f94d1d9ab7d024f3394ca7865d7a086668d84b0e4dfb18095468b966f7afd03f3b766f02822e9b19cfddf0f95ad7c0c3908e5a5806e9')
_distdir="Feed-Find-0.07"

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
