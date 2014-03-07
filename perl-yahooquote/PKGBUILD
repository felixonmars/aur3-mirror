# Maintainer:

pkgname=perl-yahooquote
_pkgname=Finance-YahooQuote
pkgver=0.24
pkgrel=1
pkgdesc="A Perl module that pull one or more stock quotes from Yahoo! Finance."
arch=('i686' 'x86_64')
url="http://search.cpan.org/~edd/Finance-YahooQuote/YahooQuote.pm"
license=('PerlArtistic' 'GPL' 'custom')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/E/ED/EDD/${_pkgname}-${pkgver}.tar.gz")

build() {
  cd $srcdir/${_pkgname}-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $srcdir/${_pkgname}-$pkgver
  make install DESTDIR="$pkgdir"
}
md5sums=('c6e97c1a2342424fc305e6bc782473b0')
