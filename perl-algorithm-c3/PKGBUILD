# CPAN Name  : Algorithm-C3
# Contributor: Anonymous

pkgname='perl-algorithm-c3'
pkgver='0.10'
pkgrel='1'
pkgdesc="A module for merging hierarchies using the C3 algorithm"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Algorithm-C3'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/Algorithm-C3-0.10.tar.gz')
md5sums=('48162c8974b3056c1315203efc7d8748')
sha512sums=('2ace81679e8ff2f3f3fbe8028741aef0833b1415a7cde0d1b20c90557889347685d1135029cd849324b6d40c435a80b228549bf669bbf43f9a1b2ed7075b605e')

build() {
  cd Algorithm-C3-0.10
  PERL_MM_USE_DEFAULT=1
  INSTALLDIRS=vendor  
  perl Makefile.PL 
  make
}

check() {
  cd Algorithm-C3-0.10
  make test
}

package() {
  cd Algorithm-C3-0.10
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name 'perllocal.pod' -delete
}
