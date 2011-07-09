# Maintainer: Christian Sturm <reezer@reezer.org>
pkgname=perl-compress-lzf
pkgver=3.43
pkgrel=1
pkgdesc="extremely light-weight Lempel-Ziv-Free compressionl"
arch=(any)
url="http://beta.metacpan.org/module/Compress::LZF"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12.0')
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/Compress-LZF-$pkgver.tar.gz)
md5sums=('b9dcb1bae6dc48ec45dd370e75000c05')

build() {
  cd "$srcdir/Compress-LZF-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1
}

# vim:set ts=2 sw=2 et:
