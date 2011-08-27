# Maintainer: Rene Peinthor <peinthor@gmail.com>
pkgname=blender-beta
pkgver=2.57
pkgrel=2
pkgdesc="Blender beta version build from source"
arch=('i686' 'x86_64')
url="http://blender.org/"
depends=('libpng' 'mesa' 'openexr' 'python=3.2' 'libsamplerate' 'ffmpeg' 'fftw' 'lcms' 'openal')
makedepends=('python' 'cmake')
provides=('blender=$pkgver')
conflicts=('blender')
license=('GPL')
install=blender.install
#source=(http://download.blender.org/source/blender-$pkgver-beta.tar.gz blender.desktop)
source=(http://rp.oldsch00l.com/tmp/source/blender-$pkgver-beta-source.tar.bz2 blender.desktop)
md5sums=('6f661cf2b2173fb5c8450ad04e218c70'
         '634b532b58d5ef51bcbb7859b318e81d')

extractedSrcDir="blender-$pkgver-beta-source"

build() {
  cd "$srcdir"/$extractedSrcDir

  msg "Starting make..."
  ##########
  [ -e "$srcdir"/blender-$pkgver-beta-build ] || mkdir -p "$srcdir"/blender-$pkgver-beta-build
  cd "$srcdir"/blender-$pkgver-beta-build
  cmake	-DPYTHON_VERSION=3.2mu \
		-DWITH_INSTALL_PORTABLE=OFF \
		-DWITH_LCMS=ON \
		-DWITH_FFTW3=ON \
		-DWITH_CODEC_SNDFILE:BOOL=ON \
		-DWITH_CODEC_FFMPEG:BOOL=ON \
		-DWITH_PYTHON_INSTALL:BOOL=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr "$srcdir"/$extractedSrcDir
  make
  ##########
  # now compile some plugins
  cp -rf "$srcdir"/$extractedSrcDir/release/plugins/* \
    "$srcdir"/$extractedSrcDir/source/blender/blenpluginapi/
  cd "$srcdir"/$extractedSrcDir/source/blender/blenpluginapi
  chmod 755 bmake
  make
}

package() {
  cd "$srcdir"/blender-$pkgver-beta-build
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir"/blender.desktop \
    "$pkgdir"/usr/share/applications/blender.desktop

  # install plugins
  install -d -m755 "$pkgdir"/usr/share/blender/`ls "$pkgdir"/usr/share/blender`/plugins/{sequence,texture}
  cp "$srcdir"/$extractedSrcDir/source/blender/blenpluginapi/sequence/*.so \
    "$pkgdir"/usr/share/blender/*/plugins/sequence/
  cp "$srcdir"/$extractedSrcDir/source/blender/blenpluginapi/texture/*.so \
    "$pkgdir"/usr/share/blender/*/plugins/texture/
}
