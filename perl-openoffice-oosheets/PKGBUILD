# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-openoffice-oosheets'
pkgver='0.70'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-parser>=0')
makedepends=()
url='https://metacpan.org/release/OpenOffice-OOSheets'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZA/ZAG/OpenOffice-OOSheets-0.70.tar.gz')
md5sums=('07e5899570305ff6bdbd81f981a0358d')
sha512sums=('0d91fb9f407f129cdc5ed8d3df8475be10ebdaed3029c12ec1aaf855de4cabb21a9db97483dae154bcc9920caba5635d82240246695c7b3bd6975978e79fae3c')
_distdir="OpenOffice-OOSheets-0.70"

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
