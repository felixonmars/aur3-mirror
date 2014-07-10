# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-geo-coder-many'
pkgver='0.46.5'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-geo-distance-xs>=0.08' 'perl-http-message>=0' 'perl-list-moreutils>=0.22' 'perl-list-util-weightedroundrobin>=0.4' 'perl-sort-versions>=1.5')
makedepends=()
checkdepends=('perl-test-exception>=0' 'perl-test-mockobject>=0' 'perl-test-pod-coverage>=0')
url='http://search.cpan.org/dist/Geo-Coder-Many'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAORU/Geo-Coder-Many-0.46-5.tar.gz')
md5sums=('3f172b5dfc7982ae316a5585a5cc63ab')
sha512sums=('d0f0c91991bffe745d632c2b957390e6c4ff91a8cda450429a0fd616d60164b24d616f250ced7c636313aeca8ba2acaf871a4442b979496805ab27f616c4082e')
_distdir="Geo-Coder-Many-0.46"

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
