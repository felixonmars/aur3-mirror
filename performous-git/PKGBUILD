# Maintainer: dawn <crackofdusk at gmail ... com>
# Contributors: Profpatsch [https://bbs.archlinux.org/misc.php?email=68112]
#               ajs124

pkgname=performous-git
pkgver=0.6.1_951_g37983fb
pkgrel=1
pkgdesc="Karaoke game"
arch=('i686' 'x86_64')
url="http://performous.org"
license=('GPL')
depends=('boost' 'sdl2' 'ffmpeg-compat' 'cairo>=1.2' 'librsvg' 'glew' 'libxml++' 'portaudio' 'imagemagick')
optdepends=('portmidi: MIDI drum support' 'opencv: webcam support' 'ttf-ms-fonts: Microsoft core fonts')
makedepends=('cmake>=2.4' 'git' 'help2man')
provides=(performous)
conflicts=(performous)
source=($pkgname::"git+https://github.com/performous/performous.git")
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe | sed -e 's|-|_|g'
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir build -p
  cd build
  cmake -DAVCodec_INCLUDE=/usr/include/ffmpeg-compat/libavcodec/avcodec.h \
        -DAVFormat_INCLUDE=/usr/include/ffmpeg-compat/libavformat/avformat.h \
        -DSWScale_INCLUDE=/usr/include/ffmpeg-compat/libswscale/swscale.h \
        -DMagick++_LIBRARY=/usr/lib/libMagick++-6.Q16HDRI.so \
        -DMagick_LIBRARY=/usr/lib/libMagickCore-6.Q16HDRI.so \
        -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}/" install
}
