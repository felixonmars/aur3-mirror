# Contributor: Max Roder <maxroder@web.de>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-exporter'
pkgver='5.67'
pkgrel='1'
pkgdesc="Implements default import method for modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Exporter'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/Exporter-5.67.tar.gz')
md5sums=('99ddc4eac35ba72d7d8e8b7887f71c09')
sha512sums=('eea2968633f25dc17da44b700c98dca0f4dce079b7db41977c8982abf7e70ad51608d740f4f53fcf49f7716cb0493a5935c43c6c32c0f942b3e9f24c634867c5')
_distdir="${srcdir}/Exporter-5.67"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
