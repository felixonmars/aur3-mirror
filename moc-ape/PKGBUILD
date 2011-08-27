# Contributor: xjpvictor <emailhuangke@gmail.com>

pkgname=moc-ape
pkgver=2.5.0_alpha4
pkgrel=1
pkgdesc="An ncurses console audio player with support for the mp3, ogg, and wave formats"
arch=('i686' 'x86_64')
url="http://moc.daper.net/"
license=('GPL')
depends=('libmad' 'libid3tag' 'jack-audio-connection-kit' 'curl' 'libsamplerate' 'libtool')
makedepends=('speex' 'ffmpeg' 'taglib' 'libmpcdec' 'wavpack' 'libmodplug')
conflicts=('moc' 'moc-svn' 'moc-unstable-ape')
optdepends=('speex: for using the speex plugin' 'ffmpeg: for using the ffmpeg plugin' 'taglib and libmpcdec: for using the musepack plugin' 'wavpack: for using the wavpack plugin' 'libmodplug: for using the modplug plugin')
options=('!libtool')
source=(ftp://ftp.daper.net/pub/soft/moc/unstable/moc-${pkgver/_/-}.tar.bz2 moc-${pkgver/_/-}-ffmpeg.diff)
md5sums=('2dd0cb6481d77fda09c58ec3154a21c0' 'ff0f0691b054cc277375fbf3731bfc1e')

build() {
  cd "${srcdir}/moc-${pkgver/_/-}"
  patch -p1 < ../moc-${pkgver/_/-}-ffmpeg.diff || return 1
  sed -i 's|ffmpeg/avformat.h|libavformat/avformat.h|' decoder_plugins/ffmpeg/ffmpeg.c || return 1
  ./configure --prefix=/usr --without-rcc --without-aac --with-oss --with-alsa --with-jack --with-mp3 --with-musepack --with-vorbis --with-flac --with-wavpack --with-sndfile --with-modplug --with-ffmpeg --with-speex --with-samplerate --with-curl || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
