# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=perl-encode-jis2k
pkgver=0.02
pkgrel=1
pkgdesc="Encode::JIS2K - JIS X 0212 (aka JIS 2000) Encodings"
arch=('any')
url="http://search.cpan.org/~dankogai/Encode-JIS2K-$pkgver/JIS2K.pm"
license=('PerlArtistic')
depends=('perl')
options=(!emptydirs !zipman)
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DANKOGAI/Encode-JIS2K-$pkgver.tar.gz")

build() {
  cd "$srcdir/Encode-JIS2K-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL
  make
}

package() {
  cd "$srcdir/Encode-JIS2K-$pkgver"
  make DESTDIR=$pkgdir install
}

md5sums=('00e73ee943fb2f882b00b7b61e4c9db1')
