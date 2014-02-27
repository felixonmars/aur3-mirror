# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-class-dbi-classgenerator'
pkgver='1.03'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbd-sqlite>=0' 'perl-dbi>=0')
makedepends=()
url='http://search.cpan.org/dist/Class-DBI-ClassGenerator'
source=('http://search.cpan.org/CPAN/authors/id/D/DC/DCANTRELL/Class-DBI-ClassGenerator-1.03.tar.gz')
md5sums=('577797de8443bd66ff38fbf7f527d488')
sha512sums=('8b5f06329c7e9d530b32b091831c4719a9807cb35260c82f544d7a1fb8f89a36bca87e944f6a6f37437a05b1af6a95b102d13c0d4810068fc50403d51464edad')
_distdir="Class-DBI-ClassGenerator-1.03"

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
