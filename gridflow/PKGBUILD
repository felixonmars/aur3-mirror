# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Bernardo Barros <bernardobarros AT-NOsPAM gmail.com>
# Contributor: farid abdelnour <farid at atelier-labs.org>

# NOTE: change pkgname to pd-gridflow ?

pkgname=gridflow
pkgver=9.12
pkgrel=2
pkgdesc="A Multidimensional dataflow processing library for PureData, designed for interactive multimedia."
arch=('i686' 'x86_64')
url="http://gridflow.ca/"
depends=('pd' 'ruby' 'libdc1394' 'fftw' 'sdl' 'aalib' 'libpng' 'libjpeg' 'netpbm' 'libquicktime' 'fftw' 'xf86-video-v4l') # 'libmpeg3')
groups=('pd-externals')
license=('GPL2')
source=(http://gridflow.ca/download/gridflow-$pkgver.tar.gz)
md5sums=('f22a46e8b77fc1f16edb72f5e0e3e351')

build() {

  cd $srcdir/$pkgname-$pkgver
 
 ./configure --no-desiredata --no-quartz --no-quicktimeapple --no-objcpp --no-opencv
  make
}

package() {

  mkdir -p $pkgdir/usr/lib/pd/extra
  cp -rf $srcdir/$pkgname-$pkgver $pkgdir/usr/lib/pd/extra
}
