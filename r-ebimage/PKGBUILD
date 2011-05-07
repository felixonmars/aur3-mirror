# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-ebimage
pkgver=3.8.0
pkgrel=1
pkgdesc="Bioconductor Package: reading, writing, processing and analysis of images. For the R language."
arch=('i686' 'x86_64')
url="http://www.bioconductor.org/help/bioc-views/release/bioc/html/EBImage.html"
license=("Artistic-2.0")
depends=('r' 'imagemagick' 'gtk2')
source=(http://www.bioconductor.org/packages/release/bioc/src/contrib/EBImage_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./EBImage
}
md5sums=('b611b94744f2d20be1ace745dccf244c')
