# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-net-dns-sec'
pkgver='0.19'
pkgrel='1'
pkgdesc="DNSSEC extensions to Net::DNS"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-crypt-openssl-bignum>=0.03' 'perl-crypt-openssl-dsa>=0.1' 'perl-crypt-openssl-rsa>=0.19' 'perl-digest-bubblebabble>=0.01' 'perl-mime-base32' 'perl-net-dns>=0.69' 'perl>=5.006')
makedepends=()
url='http://search.mcpan.org/dist/Net-DNS-SEC'
source=('http://search.mcpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-SEC-0.19.tar.gz')
md5sums=('5b923c373d38df32b084b38eae2a96f5')
sha512sums=('be96911d21ec41ab73bafce294d0483dc4d31a36b0989a6641d98a5d85674714baa0c983d2bddd1708fc1b0ea81afbabc6ee8a53abd3d4f3c7ac7b19c21c4576')
_distdir="Net-DNS-SEC-0.19"

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
