# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-http-dav'
pkgver='0.47'
pkgrel='1'
pkgdesc="A client module for the WebDAV protocol"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww' 'perl-uri' 'perl-xml-dom')
makedepends=()
url='http://search.cpan.org/dist/HTTP-DAV'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/COSIMO/HTTP-DAV-0.47.tar.gz')
md5sums=('6f27cc2f1b06bc4388fc9c4dbdb3cb46')
sha512sums=('920d725d9986e5fb7fa5d7a93c9b5ec1af37a966d976826940c5ca59a64c363a0e53fa409ed546bc3306ab49c03f00dc089f474c18a4ce90a2c752a5e5a88894')
_distdir="HTTP-DAV-0.47"

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
