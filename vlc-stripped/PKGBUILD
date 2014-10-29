# $Id: PKGBUILD 224259 2014-10-13 07:12:24Z bpiotrowski $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

basename=vlc
pkgname=vlc-stripped
pkgver=2.1.5
pkgrel=4
pkgdesc="A multi-platform MPEG, VCD/DVD, and DivX player"
arch=('i686' 'x86_64')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1' 'GPL2')
depends=("ffmpeg" "libmad" "libdvdread" "libxml2"
"a52dec" "x264" "libmpeg2" "v4l-utils" "live-media"
"libxcb" "flac" "faad2" "lua" "libcdio")
optdepends=('avahi: for service discovery using bonjour protocol'
'libnotify: for notification plugin'
'ncurses: for ncurses interface support'
'libdvdcss: for decoding encrypted DVDs'
'lirc-utils: for lirc plugin'
'libavc1394: for devices using the 1394ta AV/C'
'libdc1394: for IEEE 1394 plugin'
'kdelibs: KDE Solid hardware integration'
'libva-vdpau-driver: vdpau back-end for nvidia'
'libva-intel-driver: back-end for intel cards'
'libbluray: for Blu-Ray support'
'flac: for Free Lossless Audio Codec plugin'
'portaudio: for portaudio support'
'twolame: for TwoLAME mpeg2 encoder plugin'
'projectm: for ProjectM visualisation plugin'
'libcaca: for colored ASCII art video output'
'libgme: for libgme plugin'
'librsvg: for SVG plugin'
'gnome-vfs: for GNOME Virtual File System support'
'libgoom2: for libgoom plugin'
'vcdimager: navigate VCD with libvcdinfo'
'aalib: for ASCII art plugin'
'libmtp: for MTP devices support'
'smbclient: for SMB access plugin'
'libcdio: for audio CD playback support'
'ttf-freefont: for subtitle font '
'ttf-dejavu: for subtitle font'
'opus: for opus support'
'libssh2: for sftp support'
'lua-socket: for http interface')
conflicts=('vlc-plugin')
replaces=('vlc-plugin')
backup=('usr/share/vlc/lua/http/.hosts'
'usr/share/vlc/lua/http/dialogs/.hosts')
options=('!emptydirs')
install=vlc.install
source=("http://download.videolan.org/${basename}/${pkgver}/${basename}-${pkgver}.tar.xz"
'vlc-2.0.7-vaapi-compat.patch'
'vlc-2.1.5-ffmpeg-2.4.patch'
'vlc-2.1.5-avformat-initialize-probe-data-fixes-11851.patch')
md5sums=('3941b561f590cc95ca5e795213cba2f2'
'6df10774bb7acf20e09d6139e5c7839e'
'068a1b792064bb1aff0765a3ffa8a27a'
'787a854f3acde37cd6e76a8fa8e6f1d0')

prepare() {
  cd "${srcdir}/${basename}-${pkgver}"

  patch -p1 -i "${srcdir}/vlc-2.0.7-vaapi-compat.patch"
  patch -p1 -i "${srcdir}/vlc-2.1.5-ffmpeg-2.4.patch"
  patch -p1 -i "${srcdir}/vlc-2.1.5-avformat-initialize-probe-data-fixes-11851.patch"
  autoreconf -fi

  sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype.c
  sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
}

build() {
  cd "${srcdir}/${basename}-${pkgver}"

  #CFLAGS+=" -I/usr/include/samba-4.0" CPPFLAGS+=" -I/usr/include/samba-4.0" \
    ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-qt \
    --enable-ncurses \
    --disable-rpath \
    --enable-faad \
    --enable-nls \
    --enable-lirc \
    --enable-ncurses \
    --enable-realrtsp \
    --enable-aa \
    --enable-vcdx \
    --enable-upnp \
    --enable-opus \
    --enable-sftp \
    --disable-bluray --disable-linsys --disable-decklink --disable-libvnc \
    --disable-libfreerdp --disable-omxil --disable-omxil-vout --disable-rpi-omxil \
    --disable-crystalhd --disable-vdpau --disable-libva --disable-dxva2 --disable-vda \
    --disable-fdkaac --disable-wasapi --disable-opensles --disable-audioqueue \
    --disable-chromaprint --disable-ios-vout --disable-ios-vout2 \
    --disable-udev --disable-dbus --disable-nls --disable-rpath --disable-mtp \
    --disable-debug --disable-gprof --disable-cprof --disable-run-as-root \
    --disable-coverage --disable-shout --disable-dvdnav --disable-oss \
    --disable-libcddb --disable-growl --disable-notify \
    --disable-taglib --disable-dv1394 --disable-dc1394 \
    --disable-opencv --disable-smbclient --disable-gnomevfs \
    --disable-vcdx --disable-libtar --disable-dca \
    --disable-mkv --disable-mod --disable-mpc --disable-wma-fixed \
    --disable-gme --disable-swscale --disable-shine \
    --disable-postproc --disable-png --disable-fluidsynth --disable-quicksync \
    --disable-twolame --disable-quicktime --disable-dirac --disable-schroedinger \
    --disable-zvbi --disable-telx --disable-tiger --disable-kate \
    --disable-glx --disable-tremor --disable-speex \
    --disable-sdl-image --disable-sdl --disable-svg --disable-opus \
    --disable-directx --disable-directfb --disable-pulse --disable-aa --disable-caca \
    --disable-waveout --disable-macosx-audio --disable-macosx-vout --disable-jack \
    --disable-upnp --disable-skins2 --disable-projectm --disable-goom --disable-vsxu \
    --disable-macosx --disable-kva --disable-atmo --disable-kai \
    --disable-bonjour --disable-libgcrypt --disable-gnutls --disable-update-check

  LUAC=/usr/bin/luac  LUA_LIBS="`pkg-config --libs lua`" \
    RCC=/usr/bin/rcc-qt4

  make
}

package() {
  cd "${srcdir}/${basename}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  for res in 16 32 48 128; do
    install -D -m644 "${srcdir}/vlc-${pkgver}/share/icons/${res}x${res}/vlc.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/vlc.png"
  done
}
