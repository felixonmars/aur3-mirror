# Maintainer: kevku <kevku@msn.com>
pkgname=perl-exporter-tidy
pkgver=0.07
pkgrel=1
pkgdesc="Exporter::Tidy - Another way of exporting symbols"
arch=('any')
url="http://search.cpan.org/~juerd/Exporter-Tidy"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/J/JU/JUERD/Exporter-Tidy-$pkgver.tar.gz")
md5sums=('16df398e725c7bbffe3ed5e11a0848cd')

build() {
  cd "$srcdir/Exporter-Tidy-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Exporter-Tidy-$pkgver"
  make install DESTDIR="$pkgdir/"
}
