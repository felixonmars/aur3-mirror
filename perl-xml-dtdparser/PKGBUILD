# Contributor: Mikolaj Pastuszko <deluminathor@gmail.com>
license=('Perl')
arch=('i686' 'x86_64')
pkgname=perl-xml-dtdparser
pkgver=2.01
pkgrel=1
pkgdesc="Quick and dirty DTD parser "
depends=('perl')
url="http://search.cpan.org/~jenda/XML-DTDParser-2.01/"

source=("http://search.cpan.org/CPAN/authors/id/J/JE/JENDA/XML-DTDParser-$pkgver.tar.gz")
md5sums=(746b6a7ecc60a8dde1bc5a81ddb068a6)

build() {
  cd $srcdir/XML-DTDParser-$pkgver
  perl Makefile.PL PREFIX=/usr
  make
  make test
}

package() {
  cd $srcdir/XML-DTDParser-$pkgver

  make DESTDIR="$pkgdir/" install
}

