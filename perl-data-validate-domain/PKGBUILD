# CPAN Name  : Data-Validate-Domain
# Contributor: Anonymous

pkgname='perl-data-validate-domain'
pkgver='0.10'
pkgrel='2'
pkgdesc="domain validation methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-net-domain-tld>=1.62')
makedepends=()
url='http://search.cpan.org/dist/Data-Validate-Domain'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEELY/Data-Validate-Domain-0.10.tar.gz')
md5sums=('1331c0f47c024a83c610f8598490423a')
sha512sums=('d6ba6f63ef09cdb92f65d96451109ee0104b3ced164800cc07939b368d53d37043753e659d46ca8586bf8614c2c1908dc5ca36a5e7ffaae94e4a822a8fd44653')

build() {
  cd "$srcdir/Data-Validate-Domain-0.10"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Data-Validate-Domain-0.10"
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/Data-Validate-Domain-0.10"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}
