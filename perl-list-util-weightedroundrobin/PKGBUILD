# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-list-util-weightedroundrobin'
pkgver='0.4'
pkgrel='1'
pkgdesc="Creates a list based on weighted input"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/List-Util-WeightedRoundRobin'
source=('http://search.cpan.org/CPAN/authors/id/F/FR/FRIFFIN/List-Util-WeightedRoundRobin-0.4.tar.gz')
md5sums=('03013630a0c67a5fdd99f4e8a7905b75')
sha512sums=('687c14cddefd2cf2bbeefe03bc0f5bbd59a9e906f5a2e64e00e2c570f56b959bccd737e16a8dc99e51cbb2276ef05cb513dad29a15d3b66ba649f034ddac5f27')
_distdir="List-Util-WeightedRoundRobin-0.4"

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
