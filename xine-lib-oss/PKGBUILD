# based on the xine-lib package from ABS.
# Maintainer: Wintershade (Wintershade - AT - gmail - DOT - com)
# I adopted this package, and I don't guarantee I'll maintain this package for a long time.
# Go in ${srcdir} and run ./configure --help to see which dependencies you need.

pkgname=xine-lib-oss
realname=xine-lib
pkgver=1.1.19
pkgrel=1
pkgdesc="A multimedia playback engine with OSS4 support"
arch=('i686' 'x86_64')
url="http://www.xine-project.org"
license=('LGPL' 'GPL')
depends=('esd-oss' 'flac' 'libgl' 'libmng' 'libtheora' 'libxvmc'  'libvorbis' 'sdl'
         'libxcb' 'wavpack' 'ffmpeg' 'faad2' 'heimdal')

makedepends=('pkg-config' 'libtool' 'imagemagick' 'smbclient' 'mesa' 'oss' 
             'vcdimager' 'gtk2' 'speex' 'aalib')

optdepends=('imagemagick: for using the imagemagick plugin' \
	    'smbclient: for using the smb plugin' \
            'jack: for using the jack plugin' \
	    'vcdimager: for using the vcd plugin' \
            'gtk2: for using the gdk-pixbuf plugin' \
	    'mesa: for using the opengl plugin' \
            'libpulse: for using the pulseaudio plugin' \
	    'speex: for using the speex plugin' \
            'aalib: for using the aalib plugin' \
	    'codecs: Non-Linux native codec pack' \
	    'codecs64: Non-Linux native codec pack')

options=('!libtool')
provides=('xine-lib'="$pkgver")
conflicts=('xine-lib')
source=(http://downloads.sourceforge.net/sourceforge/xine/${realname}-${pkgver}.tar.bz2 \
        xine-lib-1.1.1-configure-no-mcpu-march.patch \
	xine-lib-1.1.19-xvmc.patch)
md5sums=('a410a0f0617e1d6309f0cbe907f73f8a' \
	 '9776df4eb54d2f1f68d8268adbc3b5c2' \
         '8662fb124870b1dd7effe4ff5e2a2e3d')
sha1sums=('5afcc28c5cf2bdaab99d951960f6587797e1e5a0' \
	  '121a8358d7919b2e51067412373f52848290338a' \
	  '920bf27e6e3523dfe4cc9c802ff713e9688a3f34')

build() {
  cd "${srcdir}/${realname}-${pkgver}"
  patch -p0 < ../xine-lib-1.1.1-configure-no-mcpu-march.patch
  patch -p0 < ../xine-lib-1.1.19-xvmc.patch

  libtoolize --force --copy
  aclocal -I m4
  autoconf
  automake --add-missing


  ./configure --prefix=/usr --with-w32-path=/usr/lib/codecs \
    --with-dvdnav-prefix=/usr/lib \
    --with-xv-path=/usr/lib --with-xxmc-path=/usr/lib \
    --with-xvmc-path=/usr/lib --with-freetype --with-fontconfig \
    --enable-ipv6 --with-imagemagick --enable-optimizations \
    --enable-nls --enable-antialiasing --enable-largefile --enable-fb \
    --with-libflac --with-wavpack --with-xcb --with-external-libfaad \
    --enable-oss \
    --without-arts --with-jack --without-speex --without-alsa \
    --disable-gnomevfs --without-pulseaudio --enable-w32dll \
    --enable-dvdnavtest --with-external-ffmpeg || return 1

  make
}

package() {
  cd "${srcdir}/${realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}