# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-package-constants'
pkgver='0.06'
pkgrel='1'
pkgdesc="List all constants declared in a package"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='http://search.mcpan.org/dist/Package-Constants'
source=('http://search.mcpan.org/CPAN/authors/id/B/BI/BINGOS/Package-Constants-0.06.tar.gz')
md5sums=('e608e8eb260ee6226943c67eba1015ed')
sha512sums=('a3f855435a989252551dfbd50492dcae5bdfb01efe14c2ef40679722305bb67097eb4c969023df1da00ee22d92f88e39439ebdeaae0b1f3a3fc6c561f3fa8481')
_distdir="Package-Constants-0.06"

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
