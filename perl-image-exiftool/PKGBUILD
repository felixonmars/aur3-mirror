#Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgname=perl-image-exiftool
pkgver=8.65
pkgrel=1
pkgdesc="Read and write meta information"
arch=('any')
url="http://search.cpan.org/dist/Image-ExifTool/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/E/EX/EXIFTOOL/Image-ExifTool-$pkgver.tar.gz) 

build() {
  cd  "$srcdir/Image-ExifTool-$pkgver" || return 1

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor &&
  make &&
  make DESTDIR="$pkgdir" install || return 1

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
md5sums=('8b27b63af0eec744afb7f373750c282b')
