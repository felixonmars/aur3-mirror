# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-webservice-cryptsy'
pkgver='1.008003'
pkgrel='1'
pkgdesc="implementation of www.cryptsy.com API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message>=0' 'perl-json-maybexs>=0' 'perl-lwp-protocol-https>=0' 'perl-moo>=1.004002' 'perl-uri>=0' 'perl-libwww>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-deep>=0')
url='http://search.cpan.org/dist/WebService-Cryptsy'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZO/ZOFFIX/WebService-Cryptsy-1.008003.tar.gz')
md5sums=('ee45870720265318bb82ff6b956eada7')
sha512sums=('e81cc662803fff1c6174601d443e647f8a829e6f3fec6e63937b2d03a2caf87c592fe59a569b410d531af8be9893491469108c4c98295dd77e6082df39155b2c')
_distdir="WebService-Cryptsy-1.008003"

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
