# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Gabriele Lanaro <gabriele.lanaro@gmail.com>
pkgname=image2mpeg  
pkgver=1.02
pkgrel=1 
pkgdesc="A tool to convert digital photos (and other images) into MPEG movie streams."
url="http://www.gromeck.de/?image2mpeg"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ffmpeg' 'mjpegtools>=1.6' 'imagemagick>=6.1.8' 'toolame' 'libmad' 'madplay' )
optdepends=('vcdimager: to generate VCD or SVCDs from the generated streams'
            'dvdstyler: for dvd authoring'  )
makedepends=()
source=(http://www.gromeck.de/uploads/media/$pkgname-$pkgver.tar.gz)
md5sums=('de3c21ffdd66798f3624a2fa0e8901e4')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}