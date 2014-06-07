# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-exporter-tiny'
pkgver='0.038'
pkgrel='1'
pkgdesc="an exporter with the features of Sub::Exporter but only core dependencies"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.1')
makedepends=()
url='http://search.cpan.org/dist/Exporter-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/Exporter-Tiny-0.038.tar.gz')
md5sums=('9ab8587a1c95ad7b666fbc43ab76f16e')
sha512sums=('17125ef2120e2624eb857370cf2d4dcd8172a31f6908424e2a57595e3a3e1746081c3713e12440ea8cc378f22ef83ba5c200db5a20b5dd48a664245d827f09c2')
_distdir="Exporter-Tiny-0.038"

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
