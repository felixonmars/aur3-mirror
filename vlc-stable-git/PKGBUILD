# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Rob McCathie <korrode at gmail>
# Contributor: Giovanni Scafora <giovanni at archlinux dot org>
# Contributor: Sarah Hay <sarahhay at mb dot sympatico dot ca>
# Contributor: Martin Sandsmark <martin dot sandsmark at kde dot org>
# Contributor: heaven <aheaven87 at gmail dot com>
# Contributor: graysky <graysky at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: MacWolf <macwolf at archlinux dot de>

_name=vlc
pkgname=vlc-stable-git
pkgver=2.1.6.0.gea01d28
_series=2.1
pkgrel=1
pkgdesc="A multi-platform MPEG, VCD/DVD, and DivX player. Stable v2.1 maintenance GIT branch."
arch=('i686' 'x86_64')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1' 'GPL2')
depends=('a52dec' 'libdvbpsi' 'libxpm' 'libdca' 'qt4' 'libproxy'
         'sdl_image' 'libdvdnav' 'libtiger' 'lua51' 'libmatroska'
         'zvbi' 'taglib' 'libmpcdec' 'ffmpeg' 'faad2' 'libupnp'
         'libshout' 'libmad' 'libmpeg2' 'libmodplug'
         'xcb-util-keysyms' 'libtar' 'libxinerama' 
         'fluidsynth'
         'libbluray'
         'flac'
         'libdvdcss'
         'libcdio'
         'vcdimager'
         'libmtp'
         'smbclient'
         'libssh2'
         'ncurses'
         'aalib'
         )
makedepends=('live-media' 'libnotify' 'kdelibs' 'libtool'
             'libdc1394' 'libavc1394' 'lirc-utils' 'libcaca'
             'librsvg' 'portaudio' 'libgme' 'xosd' 'projectm'
             'twolame' 'gnome-vfs'
             'libgoom2' 'opus' 'mesa'
             'git')
optdepends=('avahi: for service discovery using bonjour protocol'
            'libnotify: for notification plugin'
            'ncurses: for ncurses interface support'
            'lirc-utils: for lirc plugin'
            'libavc1394: for devices using the 1394ta AV/C'
            'libdc1394: for IEEE 1394 plugin'
            'kdelibs: KDE Solid hardware integration'
            'libva-vdpau-driver: vdpau back-end for nvidia'
            'libva-intel-driver: back-end for intel cards'
            'portaudio: for portaudio support'
            'twolame: for TwoLAME mpeg2 encoder plugin'
            'projectm: for ProjectM visualisation plugin'
            'libcaca: for colored ASCII art video output'
            'libgme: for libgme plugin'
            'librsvg: for SVG plugin'
            'gnome-vfs: for GNOME Virtual File System support'
            'libgoom2: for libgoom plugin'
            'ttf-freefont: for subtitle font '
            'ttf-dejavu: for subtitle font'
            'opus: for opus support'
            'lua-socket: for http interface')
conflicts=("${_name}" 'vlc-git' 'vlc-dev' 'vlc-plugin')
provides=("${_name}=${pkgver}")
# backup=('usr/share/vlc/lua/http/.hosts'
#         'usr/share/vlc/lua/http/dialogs/.hosts')
options=('!emptydirs' '!libtool')
install="${_name}.install"
source=("git://git.videolan.org/${_name}/${_name}-${_series}.git"
        'vlc-2.0.7-vaapi-compat.patch'
        'libavcodec-ver.patch'
        "${_name}.install")
md5sums=('SKIP'
         '6df10774bb7acf20e09d6139e5c7839e'
         'e4184de72e82d7bd1d0eb956e2a79050'
         '804f17ca1c1f7c28188ac1c526974a85')

pkgver() {
  cd "${srcdir}/${_name}-${_series}"
  git describe --long | sed -r 's/-/./g'
}

prepare() {
  cd "${srcdir}/${_name}-${_series}"
  
  patch -Np1 -i "${srcdir}/vlc-2.0.7-vaapi-compat.patch"
  
  patch -Np1 -i "${srcdir}/libavcodec-ver.patch"
  
  sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype.c
  sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
}

build() {
  cd "${srcdir}/${_name}-${_series}"
  
  msg 'Generating necessary files...'
  ./bootstrap
  msg 'Done. Configuring VLC...'

  CFLAGS+=" -I/usr/include/samba-4.0" CPPFLAGS+=" -I/usr/include/samba-4.0" \
  ./configure --prefix="/usr" \
              --sysconfdir="/etc" \
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
              --disable-bluray \
              --enable-taglib \
              --enable-dvdread \
              --enable-dvdnav \
              --enable-fluidsynth \
              --enable-flac \
              --enable-libtar \
              --enable-qt \
              --enable-pulse \
              --enable-alsa \
              --enable-mtp \
              --enable-sdl-image \
              --enable-vcd \
              --enable-zvbi \
              --disable-libfreerdp \
              LUAC="/usr/bin/luac" \
              LUA_LIBS="`pkg-config --libs lua5.1`" \
              RCC="/usr/bin/rcc-qt4" \
              UIC="/usr/bin/uic-qt4" \
              MOC="/usr/bin/moc-qt4"

  msg 'Done. Starting make...'
  make
}

package() {
  cd "${srcdir}/${_name}-${_series}"
  
  make DESTDIR="${pkgdir}" install
}
