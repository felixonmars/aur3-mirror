pkgname=xine-lib-vdpau-hg
pkgver=11678
pkgrel=1
pkgdesc="A free video player library for Unix with support for vdpau"
arch=('i686' 'x86_64')
url="http://www.xine-project.org"
license=('GPL')
depends=('nvidia>=190.42' 'libvdpau' 'libgl' 'libxvmc' 'esound' 'flac' 'libvorbis' \
	 'sdl' 'libmng' 'libtheora' 'libxcb' 'wavpack' 'ffmpeg' 'faad2')
makedepends=('mercurial' 'pkg-config' 'libtool' 'imagemagick' 'smbclient' 'mesa' \
	     'alsa-lib' 'vcdimager' 'jack' 'gtk2' 'libpulse' 'speex' 'aalib')
optdepends=('imagemagick: for using the imagemagick plugin' 'smbclient: for using the smb plugin' \
            'jack: for using the jack plugin' 'vcdimager: for using the vcd plugin' \
            'gtk2: for using the gdk-pixbuf plugin' 'mesa: for using the opengl plugin' \
            'libpulse: for using the pulseaudio plugin' 'speex: for using the speex plugin' \
            'aalib: for using the aalib plugin')
conflicts=('xine-lib')
provides=('xine-lib=1.2' 'xine-lib')

_hgroot="http://anonscm.debian.org/hg/xine-lib/"
_hgrepo=xine-lib-1.2

build() {

 cd $srcdir

  if [[ -d ${srcdir}/build ]]; then
       msg "Cleaning the previous build directory..."
  rm -rf ${srcdir}/build
  fi
  hg clone $srcdir/$_hgrepo $srcdir/build
  cd $srcdir/build
  ./autogen.sh --prefix=/usr --with-w32-path=/usr/lib/codecs \
    --with-xv-path=/usr/lib --with-xxmc-path=/usr/lib --with-xvmc-path=/usr/lib \
    --with-libflac --with-wavpack --with-xcb --with-jack --with-speex \
    --disable-gnomevfs --with-pulseaudio --enable-aalib --disable-modplug 
  make
}

package() {
  cd $srcdir/build
  make DESTDIR="${pkgdir}" install
}
  

