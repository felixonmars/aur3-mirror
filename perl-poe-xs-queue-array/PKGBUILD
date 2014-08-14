# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-poe-xs-queue-array'
pkgver='0.006'
pkgrel='1'
pkgdesc="XS version of POE::Queue::Array"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-poe>=0.29')
makedepends=()
url='http://search.cpan.org/dist/POE-XS-Queue-Array'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TONYC/POE-XS-Queue-Array-0.006.tar.gz')
md5sums=('3e5008977f5993ad3fc265d2d98b8ad7')
sha512sums=('500b293fc11d58beda498f91c31bcea2cb89758ffa08f548354d2ba77e06f307ebbef49aec3e34ccfbd295a2c72b1921a9d6f5ed41e88208df4b66dcb3e71c79')
_distdir="POE-XS-Queue-Array-0.006"

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
