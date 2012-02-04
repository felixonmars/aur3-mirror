# Contributor: Mikolaj Pastuszko <deluminathor@gmail.com>
license=('Perl')
arch=('i686' 'x86_64')
pkgname=perl-xml-tmx
pkgver=0.17
pkgrel=1
pkgdesc="Perl extensions for managing TMX files"
depends=('perl' 'perl-test-pod' 'perl-test-pod-coverage' 'perl-xml-dt')
url="http://search.cpan.org/~ambs/XML-TMX-0.17/"

source=("http://search.cpan.org/CPAN/authors/id/A/AM/AMBS/XML/XML-TMX-$pkgver.tar.gz")
md5sums=(6211c3f78a431263e9c2a2c67853bab8)

build() {
  cd $srcdir/XML-TMX-$pkgver
  perl Makefile.PL PREFIX=/usr
  make
  make test
}

package() {
  cd $srcdir/XML-TMX-$pkgver

  make DESTDIR="$pkgdir/" install
}

