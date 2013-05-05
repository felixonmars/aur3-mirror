# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=perl-encode-hanextra
pkgver=0.23
pkgrel=1
pkgdesc="Encode::HanExtra - Extra sets of Chinese encodings"
arch=('any')
url="http://search.cpan.org/~audreyt/Encode-HanExtra-$pkgver/lib/Encode/HanExtra.pm"
license=('MIT')
depends=('perl')
options=(!emptydirs !zipman)
source=("http://search.cpan.org/CPAN/authors/id/A/AU/AUDREYT/Encode-HanExtra-$pkgver.tar.gz")

build() {
  cd "$srcdir/Encode-HanExtra-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL
  make
}

package () {
  cd "$srcdir/Encode-HanExtra-$pkgver"
  make DESTDIR=$pkgdir install
}

md5sums=('e1d3bc32c1c8ee304235a06fbcd5d5a4')
