# CPAN Name  : Data-Validate-IP
# Contributor: SIGTERM
 
pkgname='perl-data-validate-ip'
pkgver='0.20'
pkgrel='1'
pkgdesc="Lightweight IPv4 and IPv6 validation module."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-netaddr-ip>=4')
makedepends=('perl-test-requires')
url='http://search.cpan.org/dist/Data-Validate-IP'
source=("http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Data-Validate-IP-${pkgver}.tar.gz")
sha512sums=('ae909cef008042c1b673cd60751a3dbe8412d36ce2728208c92c8201652dab5dac9fd14c7ebdcf5653d90f17bf4ecff65f44c7d67662b4587d298527cc28fc3b')
_distdir="Data-Validate-IP-${pkgver}"
 
build() {
    cd "$srcdir/$_distdir"
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make
}
 
check() {
  cd "$srcdir/$_distdir"
  PERL_MM_USE_DEFAULT=1
  make test
}
 
package() {
  cd "$srcdir/$_distdir"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}
