# Contributor: David Spicer <azleifel at googlemail.com>

pkgname=xine-lib-1.2-vdr-hg
pkgver=11592
pkgrel=1
pkgdesc="The xine engine (1.2 development branch) with VDR support"
arch=('i686' 'x86_64')
url="http://www.xine-project.org"
license=('LGPL' 'GPL')
depends=('a52dec' 'faad2' 'ffmpeg' 'libcaca' 'libdca' 'libgl' 'libmad' 'libmng'
         'libmpcdec' 'libmodplug' 'libxinerama' 'libxvmc' 'v4l-utils' 'wavpack')
makedepends=('mercurial' 'libtool' 'pkg-config' 'librsvg' 'gtk2' 'imagemagick'
             'jack' 'libpulse' 'mesa' 'smbclient' 'speex' 'aalib' 'vcdimager')
optdepends=('aalib: To use the aalib plugin' \
            'gtk2: To use the gdk-pixbuf plugin' \
            'imagemagick: To use the imagemagick plugin' \
            'jack: To use the jack plugin' \
            'libpulse: To use the pulseaudio plugin' \
            'mesa: To use the opengl plugin' \
            'smbclient: To use the smb plugin' \
            'speex: To use the speex plugin' \
            'vcdimager: To use the vcd plugin')
provides=('xine-lib=1.2' 'xine-lib-vdr')
conflicts=('xine-lib' 'xine-lib-vdr')
options=('!libtool')

_hgroot="http://hg.debian.org/hg/xine-lib/"
_hgrepo="xine-lib-1.2"

build() {
  cd ${srcdir}
  msg "Connecting to Mercurial server...."

  if [ -d ${_hgrepo} ] ; then
    cd ${_hgrepo}
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone ${_hgroot}${_hgrepo} || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/${_hgrepo}-build
  cp -r ${srcdir}/${_hgrepo} ${srcdir}/${_hgrepo}-build
  cd ${srcdir}/${_hgrepo}-build

  ./autogen.sh --prefix=/usr \
    --enable-antialiasing \
    --enable-aalib \
    --disable-gnomevfs \
    --enable-vdr \
    --with-freetype \
    --with-fontconfig \
    --without-esound \
    --without-fusionsound \
    --with-jack \
    --with-pulseaudio \
    --with-xcb \
    --with-xv-path=/usr/lib --with-xxmc-path=/usr/lib --with-xvmc-path=/usr/lib \
    --with-w32-path=/usr/lib/codecs \
    --with-wavpack
  make
}

package() {
  cd ${srcdir}/${_hgrepo}-build
  make DESTDIR=${pkgdir} install

  rm -rf ${srcdir}/${_hgrepo}-build
}
