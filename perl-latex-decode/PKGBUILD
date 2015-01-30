# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=perl-latex-decode
pkgver=0.03
pkgrel=2
pkgdesc="LaTeX::Decode - Decode from LaTeX to Unicode"
arch=('any')
url="http://search.cpan.org/~firmicus/LaTeX-Decode-$pkgver/lib/LaTeX/Decode.pm"
license=('PerlArtistic')
depends=('perl')
options=(!emptydirs !zipman)
source=("http://search.cpan.org/CPAN/authors/id/F/FI/FIRMICUS/LaTeX-Decode-$pkgver.tar.gz")

build() {
  msg "Building LaTeX::Decode..."
  cd "$srcdir/LaTeX-Decode-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Build.PL
  ./Build
}

package() {
  cd "$srcdir/LaTeX-Decode-$pkgver"
  ./Build install --destdir $startdir/pkg
}

md5sums=('21a89deebc9839b9657a834e0d6b3126')
