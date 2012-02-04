# Contributor: Erol Grahm <erol at grahm dot nu>
pkgname=ffmpeg-avs-patched
pkgver=2.2.5
pkgrel=1
pkgdesc="FFMPEG patched to work with Air Video Server 2.2.5"
arch=('i686')
url="http://www.inmethod.com/air-video/index.html"
license=('GPL' 'LGPL')
depends=('lame' 'sdl' 'libvorbis' 'faad2>=2.7' 'faac' 'xvidcore' 'zlib' 'imlib2' \
         'x264>=20100107' 'libtheora' 'opencore-amr>=0.1.2' 'alsa-lib' 'libvdpau' 'libxfixes')
provides=('ffmpeg')
conflicts=('ffmpeg')
source=(http://www.inmethod.com/air-video/download/ffmpeg-for-2.2.5.tar.bz2)
md5sums=('1623d51b433555e08d0c2fcf1dee1b55')

build() {
  cd $srcdir/ffmpeg
  ./configure --prefix=/usr --enable-pthreads \
  --disable-shared --enable-static --enable-gpl --enable-libx264 \
  --enable-libmp3lame --enable-libfaad --disable-decoder=aac
  make || return 1
  make DESTDIR="$pkgdir/" install
}
