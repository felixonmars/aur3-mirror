# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-poe-session-attributebased'
pkgver='0.10'
pkgrel='1'
pkgdesc="POE::Session syntax sweetener"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-poe>=0')
makedepends=()
url='http://search.cpan.org/dist/POE-Session-AttributeBased'
source=('http://search.cpan.org/CPAN/authors/id/C/CF/CFEDDE/POE-Session-AttributeBased-0.10.tar.gz')
md5sums=('82aafcc8a8add3040dae78dbfe42f107')
sha512sums=('06e05f132c5914bfc3cdca75fdc530df3b730bdfa39e4cec38a5c3e8784f9e3466c148f6e7ab0a512ed5b6663389c6bcdec3a2853396735c8098806dd029ccd1')
_distdir="POE-Session-AttributeBased-0.10"

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
