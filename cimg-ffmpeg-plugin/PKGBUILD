# Contributor: zoulnix <z[o]ulnix.borke[dd]uck.c[o]m>
pkgname=cimg-ffmpeg-plugin
pkgver=1
pkgrel=4
pkgdesc="Uses FFmpeg function library with CImg to access frames of a video file."
arch=('i686' 'x86_64')
url="http://cimg.sourceforge.net/"
license=('CeCiLL-C' 'CeCiLL')
depends=('cimg' 'ffmpeg')
makedepends=('')
source=(http://downloads.sourceforge.net/cimg/ffmpegplugin.tar.gz)
md5sums=('9dba57dc78b1580b166afcccfe6c97c2')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/include/CImg/plugins || return 1

  install -m644 cimgffmpeg.h \
		${pkgdir}/usr/include/CImg/plugins/ || return 1
}