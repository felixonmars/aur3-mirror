# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=perl-unicode-gcstring
pkgver=2014.06
pkgrel=1
pkgdesc="Unicode::GCString - String as Sequence of UAX #29 Grapheme Clusters"
arch=('any')
url="http://search.cpan.org/~nezumi/Unicode-LineBreak-2014.06"
license=('PerlArtistic')
depends=('perl' 'perl-mime-charset')
options=(!emptydirs !zipman)
source=("http://search.cpan.org/CPAN/authors/id/N/NE/NEZUMI/Unicode-LineBreak-$pkgver.tar.gz")

build() {
  cd "$srcdir/Unicode-LineBreak-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL
  make
}

package() {
  cd "$srcdir/Unicode-LineBreak-$pkgver"
  make DESTDIR=$pkgdir install
}

md5sums=('c908890e6a00f4203da5d4a5d6060586')
