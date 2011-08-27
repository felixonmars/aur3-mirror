# Contributor: Mikolaj Pastuszko <deluminathor@gmail.com>
license=('Perl')
arch=('i686' 'x86_64')
pkgname=perl-xml-dt
pkgver=0.56
pkgrel=1
pkgdesc="A package for down translation of XML to strings"
depends=('perl' 'perl-xml-libxml' 'perl-xml-dtdparser', 'perl-libwww')
url="http://search.cpan.org/~ambs/XML-DT-$pkgver/"

source=("http://search.cpan.org/CPAN/authors/id/A/AM/AMBS/XML/XML-DT-$pkgver.tar.gz")
md5sums=(1f7dd0c5f59d67debb99ecea2f869e38)

build() {
  cd $srcdir/XML-DT-$pkgver
  perl Makefile.PL PREFIX=/usr
  make
  make test
}

package() {
  cd $srcdir/XML-DT-$pkgver

  make DESTDIR="$pkgdir/" install
}

