# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=perl-encode-eucjpascii
pkgver=0.03
pkgrel=1
pkgdesc="Encode::EUCJPASCII - eucJP-ascii - An eucJP-open mapping"
arch=('any')
url="http://search.cpan.org/~nezumi/Encode-EUCJPASCII-$pkgver/EUCJPASCII.pm"
license=('PerlArtistic')
depends=('perl')
options=(!emptydirs !zipman)
source=("http://search.cpan.org/CPAN/authors/id/N/NE/NEZUMI/Encode-EUCJPASCII-$pkgver.tar.gz")

build() {
  cd "$srcdir/Encode-EUCJPASCII-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL
  make
}

package() {
  cd "$srcdir/Encode-EUCJPASCII-$pkgver"
  make DESTDIR=$pkgdir install
}

md5sums=('5daa65f55b7c2050bb0713d9e95f239d')
