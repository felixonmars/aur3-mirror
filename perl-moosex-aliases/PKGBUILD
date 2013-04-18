# CPAN Name  : MooseX-Aliases
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-moosex-aliases'
pkgver='0.10'
pkgrel='2'
pkgdesc="easy aliasing of methods and attributes in Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=1.09')
makedepends=('perl-test-fatal>=0.003' 'perl-test-requires')
url='http://search.cpan.org/dist/MooseX-Aliases'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/MooseX-Aliases-0.10.tar.gz')
md5sums=('148876a7f538881a81597669932c49bc')
sha512sums=('988bbae896aac9299062b84f3fb39fa09383430d7af2545c1223cd1c46e41016d61d9648eaeec62e1703aaf838db2fc72bc4a39cd2d3f87ab525ef4b3f8ba158')

build() {
  cd "$srcdir/MooseX-Aliases-0.10"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/MooseX-Aliases-0.10"
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/MooseX-Aliases-0.10"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}
