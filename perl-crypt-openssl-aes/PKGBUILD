# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-crypt-openssl-aes'
pkgver='0.02'
pkgrel='1'
pkgdesc="A Perl wrapper around OpenSSL's AES library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'openssl>=1.0.1.i')
makedepends=()
url='http://search.cpan.org/dist/Crypt-OpenSSL-AES'
source=('http://search.cpan.org/CPAN/authors/id/T/TT/TTAR/Crypt-OpenSSL-AES-0.02.tar.gz')
md5sums=('269db65cbf580c3174471a2cbc9a9d95')
sha512sums=('cac503bfa22d82d8cb1873ce97aeee4f2d698a7c0d27bcc055d2e8984094c098b0244498ee80425e0c699d46d1b204c8894fd0538dd2dc1d3ea0f87c593fc918')
_distdir="Crypt-OpenSSL-AES-0.02"

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
