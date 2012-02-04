# Contributor: Tibor Bamhor <tiborb95 at gmail dot com>

pkgname=hdrprep
pkgver=0.1.2
pkgrel=3
pkgdesc="Auto-alignment of images with various exposures for further HDR processing"
url="http://www.luxal.eu/resources/hdr/hdrprep/index.shtml"
license="GPL"
arch=('i686')
depends=( 'ale' 'perl-exiftool' 'imagemagick' )
source=(http://www.luxal.eu/resources/hdr/hdrprep/software/$pkgname-$pkgver.tgz)

md5sums=('abd8b0a3502fab9bf966c03142cefcbe')

build() {
   mkdir -p $startdir/pkg/usr/bin/  
   cd $startdir/src/$pkgname-$pkgver
   cp hdrprep.pl $startdir/pkg/usr/bin
}