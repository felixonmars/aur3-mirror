# CPAN Name  : Net-Domain-TLD
# Contributor: Anonymous

pkgname='perl-net-domain-tld'
pkgver='1.69'
pkgrel='2'
pkgdesc="Net::Domain::TLD - Work with TLD names"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Net-Domain-TLD'
source=('http://search.cpan.org/CPAN/authors/id/A/AL/ALEXP/Net-Domain-TLD-1.69.tar.gz')
md5sums=('91c1bbf87994e966775994de2179f09b')
sha512sums=('36ae72c9de476d9f4461ecc8f9aa3363e8dd6bd955c1ae30a4bdb4e9a242d49f8f9ca6f7c5101ca705a31edc860a426c868c36bcf197c36793a9063092bb7c7e')

build() {
  cd "$srcdir/Net-Domain-TLD-1.69"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Net-Domain-TLD-1.69"
  PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/Net-Domain-TLD-1.69"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}
