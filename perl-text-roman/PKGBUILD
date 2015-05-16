# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=perl-text-roman
pkgver=3.5
pkgrel=1
pkgdesc="Text::Roman - Allows conversion between Roman and Arabic algarisms"
arch=('any')
url="http://search.cpan.org/~syp/Text-Roman-$pkgver/lib/Text/Roman.pm"
license=('PerlArtistic')
depends=('perl')
options=(!emptydirs !zipman)
source=("http://search.cpan.org/CPAN/authors/id/S/SY/SYP/Text-Roman-$pkgver.tar.gz")

build() {
  msg "Building Text::Roman ..."
  cd "$srcdir/Text-Roman-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL PREFIX=/usr DESTDIR="$pkgdir"
  make
}

package() {
  cd "$srcdir/Text-Roman-$pkgver"
  make install
}

md5sums=('1f6b09c0cc1f4425b565ff787a39fd83')
