# Maintainer: Erus <erus.iluvatar@gmail.com>

_pkgbase=vlc
pkgname=vlc-nox
pkgver=2.0.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A enlighted version of the multi-platform MPEG, VCD/DVD, and DivX player"
url="http://www.videolan.org/vlc/"
license=('GPL')
provides=('vlc')
makedepends=('lirc-utils' 'libxpm' 'pkgconfig' 'live-media'
             'flac' 'libtheora' 'alsa-lib' 'jack' 'udev'
             'libraw1394' 'libdc1394' 'libavc1394' 'libva' 'chrpath')
depends=('a52dec' 'libmtp' 'libdvbpsi' 'libcdio'
         'libdca' 'sdl_image' 'libdvdnav' 'mesa'
         'lua' 'libv4l' 'libcddb' 'smbclient' 'libmatroska' 'zvbi'
         'taglib' 'sysfsutils' 'libmpcdec' 'ffmpeg' 'faad2'
         'libshout' 'libmad' 'fribidi' 'libmpeg2' 'libmodplug'
         'ttf-freefont' 'libxv' 'libass' 'xdg-utils')
optdepends=('ncurses: for ncurses interface support'
            'libdvdcss: for decoding encrypted DVDs'
            'lirc-utils: for lirc plugin'
            'libavc1394: for devices using the 1394ta AV/C'
            'libdc1394: for IEEE 1394 plugin'
            'vdpau-video: VDPAU backend for VA API (for GPU acceleration on Nvidia cards)')
options=('!libtool')
install=vlc.install
source=("http://download.videolan.org/pub/videolan/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.xz")

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype.c

  autoreconf -fi

  ./configure --prefix=/usr --disable-qt4 --disable-skins2 \
              --disable-rpath \
              --disable-dbus \
              --enable-faad \
              --enable-v4l \
              --enable-snapshot \
              --enable-nls \
              --enable-lirc \
              --enable-pvr \
              --enable-ncurses \
              --with-live555-tree=/usr/lib/live \
              --enable-realrtsp

  make
  make DESTDIR=${pkgdir}/ install
  for res in 16 32 48 128; do
      install -D -m644 ${srcdir}/vlc-${pkgver}/share/icons/${res}x${res}/vlc.png \
          ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/vlc.png
  done
  rm -rf ${pkgdir}/usr/lib/mozilla
}
md5sums=('93e729cc970a4535b3213dbef0e69528')
sha512sums=('a680632f669fd85edf8a4bd6ae57951c8bcc4fe1c5cac039b839b7409b2e432722057c588cae1a23eec41b1cce17edff97375da584bfcb3514da3ed528b72c3d')
