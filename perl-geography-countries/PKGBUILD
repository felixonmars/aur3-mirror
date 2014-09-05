# Maintainer: Naoki Kawakami <nkawakami atto parallels dotto com>
# Module author: Abigail
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-geography-countries'
pkgver='2009041301'
pkgrel='1'
pkgdesc="2-letter, 3-letter, and numerical codes for countries."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='http://search.cpan.org/dist/Geography-Countries'
source=('http://search.cpan.org/CPAN/authors/id/A/AB/ABIGAIL/Geography-Countries-2009041301.tar.gz')
md5sums=('2c9ef26b46bbeca9abbca5015cc748b9')
sha512sums=('4197edced04c7330dfd8ba7fbf137c3b6e47fe6402b3f90bacbfddf790dc38420c500846fd1abf0a4b99a2558d651086f3daffb0e52df9b679f5aacd9a1a203d')
_distdir="Geography-Countries-2009041301"

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
