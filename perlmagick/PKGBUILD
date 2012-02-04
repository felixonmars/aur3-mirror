# Maintainer: Vincent Prelat <prelatv [at] gmail.com>

pkgname=perlmagick
pkgver=6.7.2.1
pkgrel=1
pkgdesc="Objected-oriented Perl interface to ImageMagick"
url="http://www.imagemagick.org/script/perl-magick.php"
arch=('i686' 'x86_64')
license=('custom')
depends=('imagemagick' 'perl')
source=(ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick-${pkgver%.*}-${pkgver##*.}.tar.xz)
md5sums=('9c307f0ab49ce6905cc97b7328fa25f8')

build() {
  cd "$srcdir/ImageMagick-${pkgver%.*}-${pkgver##*.}/PerlMagick"
  
  perl Makefile.PL || return 1
  make || return 1
}
package () {
  cd "$srcdir/ImageMagick-${pkgver%.*}-${pkgver##*.}/PerlMagick"
  
  make DESTDIR="$pkgdir" install || return 1
  # Man already exist with Imagmagick
  rm "$pkgdir/usr/share/man/man3/Image::Magick.3pm" || return 1
}
