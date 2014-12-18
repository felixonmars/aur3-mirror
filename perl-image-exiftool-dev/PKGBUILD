# Maintainer speps <spepser at aur dot archlinux dot org>

pkgname=perl-image-exiftool-dev
pkgver=9.78
pkgrel=1
license=('GPL' 'PerlArtistic')
pkgdesc="Reader and rewriter of EXIF informations that supports raw files. Development releases."
arch=('any')
url="http://www.sno.phy.queensu.ca/~phil/exiftool/"
depends=('perl>5.10.0')
provides=("perl-image-exiftool=$pkgver" "perl-exiftool=$pkgver" "perl-exiftool-dev=$pkgver")
conflicts=('perl-image-exiftool' 'perl-exiftool' 'perl-exiftool-dev')
replaces=('perl-exiftool-dev' 'perl-exiftool')
options=('!emptydirs')
source=("${url}Image-ExifTool-$pkgver.tar.gz")
md5sums=('a0ca36792209f3ab2459ecd365a6e16a')

build() {
  cd Image-ExifTool-$pkgver

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd Image-ExifTool-$pkgver
  make install DESTDIR="$pkgdir/"
}
