# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>

pkgname=xine-lib-vdr
pkgver=1.1.16.3
pkgrel=7
pkgdesc="xine-lib with additional support for VDR."
arch=('i686' 'x86_64')
url="http://xinehq.de/"
license=('LGPL' 'GPL')
provides=('xine-lib')
conflicts=('xine-lib')
depends=('libgl' 'libxvmc' 'esound' 'flac' 'libvorbis' 'sdl' 'libmng' 'libtheora' 'libxcb' 'wavpack' 'ffmpeg' 'heimdal' 'autoconf')
optdepends=('vdr-xine')
makedepends=('pkgconfig' 'libtool' 'imagemagick' 'smbclient' 'mesa' 'alsa-lib' 
             'vcdimager' 'jack-audio-connection-kit')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/xine/xine-lib-${pkgver}.tar.bz2)

md5sums=('4f508abf088cf427a731f85634c8260d')

build() {
  cd ${srcdir}/xine-lib-${pkgver}
  
  patch -p1 < ../../xine-lib.patch

  libtoolize --force --copy || return 1
  aclocal -I m4 || return 1
  autoconf || return 1
  automake --add-missing || return 1

  ./configure --prefix=/usr --with-w32-path=/usr/lib/codecs \
    --with-xv-path=/usr/lib --with-xxmc-path=/usr/lib --with-xvmc-path=/usr/lib \
    --with-libflac --with-wavpack --with-xcb \
    --without-arts --with-jack --without-speex \
    --disable-gnomevfs --without-pulseaudio --disable-aalib \
    --disable-modplug --with-external-ffmpeg || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
