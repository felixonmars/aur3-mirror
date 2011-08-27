# Maintainer SpepS <dreamspepser@yahoo.it>

_pkg=Image-ExifTool
_base=perl-exiftool
pkgname=$_base-dev
pkgver=8.53
pkgrel=1
license=('GPL' 'PerlArtistic')
pkgdesc="Reader and rewriter of EXIF informations that supports raw files. Development releases."
arch=('any')
url="http://www.sno.phy.queensu.ca/~phil/exiftool/"
depends=('perl>5.10.0')
provides=("$_base")
conflicts=("$_base")
options=(!emptydirs)
source=("$url$_pkg-$pkgver.tar.gz")
md5sums=('244787d80ec3a864a6691b9927cae98c')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  make install DESTDIR="$pkgdir/"
}
