# CPAN Name  : Class-C3
# Submitter  : aCiD2
# Maintainer : SIGTERM

pkgname='perl-class-c3'
pkgver='0.27'
pkgrel='1'
pkgdesc="A pragma to use the C3 method resolution order algorithm"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-algorithm-c3>=0.10')
makedepends=()
url='http://search.cpan.org/dist/Class-C3'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/Class-C3-0.27.tar.gz')
md5sums=('306b76ca764b7172100d84a806f04158')
sha512sums=('a6f707bde0eed0cd175e4165382e4f2b13df7da8ad20c0cfe5381c4c0beab75d9dafd5cff434c0687e7c33305062221b961b60b17cc9ce5bdcbcffe503ee797c')

build() {
  cd Class-C3-0.27
  PERL_MM_USE_DEFAULT=1 
  INSTALLDIRS=vendor
  perl Makefile.PL
  make
}

check() {
  cd Class-C3-0.27
  make test
}

package() {
  cd Class-C3-0.27
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}
