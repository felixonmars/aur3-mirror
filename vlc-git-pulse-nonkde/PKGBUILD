# Maintainer : cagriulas <cagriulas at gmail dot com>
# Contributor: Rob McCathie <korrode at gmail>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>
# Contributor: heaven <aheaven87 at gmail dot com>
# Contributor: graysky <graysky at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: MacWolf <macwolf at archlinux dot de>

_name=vlc
pkgname=vlc-git-pulse-nonkde
pkgver=3.0.r58089.ge0e1f0f
pkgrel=1
pkgdesc="A multi-platform MPEG, VCD/DVD, and DivX player. Development GIT Version with pulseaudio support and disabled kde dependencies."
arch=('i686' 'x86_64')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1' 'GPL2')

## Arch VLC package
depends=('a52dec' 'libdvbpsi' 'libxpm' 'libdca' 'qt4' 'libproxy'
         'sdl_image' 'libdvdnav' 'libtiger' 'lua' 'libmatroska'
         'zvbi' 'taglib' 'libmpcdec' 'ffmpeg' 'faad2' 'libupnp'
         'libshout' 'libmad' 'libmpeg2' 'xcb-util-keysyms' 'libtar'
         'libxinerama')
makedepends=('live-media' 'libnotify' 'libbluray' 'flac'
             'libdc1394' 'libavc1394' 'lirc-utils' 'libcaca'
             'librsvg' 'libgme' 'xosd' 'projectm'
             'twolame' 'aalib' 'libdvdcss'
             'vcdimager' 'opus' 'libssh2' 'mesa'
             'git')

## Rob's old minimalised deps for combating segfault
#depends=('a52dec' 'libdvbpsi' 'libxpm' 'qt4'
#         'sdl_image' 'libdvdnav' 'lua' 'libmatroska'
#         'libmpcdec' 'ffmpeg' 'faad2' 'libupnp'
#         'libmad' 'libmpeg2' 'xcb-util-keysyms'
#         'libxinerama'
#         'x264' 'fluidsynth')
#makedepends=('live-media' 'libbluray' 'flac' 'kdelibs'
#             'libdc1394' 'libavc1394' 'lirc-utils'
#             'librsvg' 'projectm'
#             'twolame' 'aalib' 'libdvdcss'
#             'vcdimager' 'opus' 'libssh2' 'mesa'
#             'git')

## Arch VLC package
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

## Rob's old minimalised optdeps
#optdepends=('ncurses: for ncurses interface support'
#            'libdvdcss: for decoding encrypted DVDs'
#            'lirc-utils: for lirc plugin'
#            'libavc1394: for devices using the 1394ta AV/C'
#            'libdc1394: for IEEE 1394 plugin'
#            'kdelibs: KDE Solid hardware integration'
#            'libva-vdpau-driver: vdpau back-end for nvidia'
#            'libva-intel-driver: back-end for intel cards'
#            'libbluray: for Blu-Ray support'
#            'flac: for Free Lossless Audio Codec plugin'
#            'twolame: for TwoLAME mpeg2 encoder plugin'
#            'projectm: for ProjectM visualisation plugin'
#            'librsvg: for SVG plugin'
#            'vcdimager: navigate VCD with libvcdinfo'
#            'aalib: for ASCII art plugin'
#            'libcdio: for audio CD playback support'
#            'ttf-freefont: for subtitle font '
#            'ttf-dejavu: for subtitle font'
#            'opus: for opus support'
#            'libssh2: for sftp support'
#            'lua-socket: for http interface')

conflicts=("${_name}" 'vlc-stable-git' 'vlc-dev' 'vlc-plugin' 'vlc-git')
provides=("${_name}=${pkgver}")
backup=('usr/share/vlc/lua/http/.hosts'
        'usr/share/vlc/lua/http/dialogs/.hosts')
options=('!emptydirs')
install="${_name}.install"
source=('git://git.videolan.org/vlc.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  echo "3.0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
}

#pkgver() {
#  cd "${srcdir}/${_name}"
#  git describe --long | sed -r 's/-/./g'
#}


prepare() {
  cd "${srcdir}/${_name}"
  sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
}

build() {
  cd "${srcdir}/${_name}"

  msg 'Generating necessary files...'
  ./bootstrap
  msg 'Done. Configuring VLC...'

## Arch VLC package
  CFLAGS+=" -I/usr/include/samba-4.0" CPPFLAGS+=" -I/usr/include/samba-4.0" \
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
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
	          --disable-kde \
	          --enable-pulse \
              LUAC=/usr/bin/luac  LUA_LIBS="`pkg-config --libs lua`" \
              RCC=/usr/bin/rcc-qt4

## Rob's old minimalised configuration for combating segfault
#  ./configure --prefix=/usr \
#              --sysconfdir=/etc \
#              --disable-rpath \
#              --enable-faad \
#              --enable-nls \
#              --enable-lirc \
#              --enable-ncurses \
#              --enable-realrtsp \
#              --enable-aa \
#              --enable-vcdx \
#              --enable-upnp \
#              --enable-opus \
#              --enable-sftp \
#              --disable-atmo \
#              --disable-bonjour \
#              --disable-caca \
#              --disable-coverage \
#              --disable-cprof \
#              --disable-dbus \
#              --disable-dbus-control \
#              --disable-dca \
#              --disable-debug \
#              --disable-decklink \
#              --disable-dirac \
#              --disable-directfb \
#              --disable-directx \
#              --disable-dshow \
#              --disable-dv \
#              --disable-fbosd \
#              --disable-fribidi \
#              --disable-gme \
#              --disable-gnomevfs \
#              --disable-gnutls \
#              --disable-goom \
#              --disable-gprof \
#              --disable-growl \
#              --disable-jack \
#              --disable-kate \
#              --disable-libcddb \
#              --disable-libgcrypt \
#              --disable-libproxy \
#              --disable-libtar \
#              --disable-linsys \
#              --disable-live555 \
#              --disable-loader \
#              --disable-macosx \
#              --disable-macosx-audio \
#              --disable-mod \
#              --disable-mtp \
#              --disable-notify \
#              --disable-opencv \
#              --disable-oss \
#              --disable-portaudio \
#              --disable-postproc \
#              --disable-pulse \
#              --disable-pvr \
#              --disable-quicktime \
#              --disable-run-as-root \
#              --disable-schroedinger \
#              --disable-shine \
#              --disable-shout \
#              --disable-sid \
#              --disable-skins2 \
#              --disable-smb \
#              --disable-sqlite \
#              --disable-switcher \
#              --disable-taglib \
#              --disable-telepathy \
#              --disable-telx \
#              --disable-tiger \
#              --disable-tremor \
#              --disable-udev \
#              --disable-update-check \
#              --disable-visual \
#              --disable-waveout \
#              --disable-wingdi \
#              --disable-xosd \
#              --disable-zvbi \
#              LUAC=/usr/bin/luac  LUA_LIBS="`pkg-config --libs lua`" \
#              RCC=/usr/bin/rcc-qt4

  msg 'Done. Starting make...'
  make
}

package() {
  cd "${srcdir}/${_name}"

  make DESTDIR="${pkgdir}" install
}
