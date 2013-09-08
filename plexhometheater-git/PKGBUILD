# Maintainer: Daniel Wallace daniel.wallace@gatech.edu
# Contributor: Congyi Wu <congyiwu at gmail dot com>
pkgname=plexhometheater-git
pkgver=0.9.9.3.1590.gc9aa9b8
epoch=1
pkgver(){
  cd $srcdir/$pkgname
  git describe --tags --long | sed 's/^pht-v//;s/-/./g'
}
pkgrel=1
pkgdesc="Plex Home Theater on Linux"
arch=('x86_64' 'i686')
url="https://github.com/plexinc/plex-home-theater-public"
license=('GPL')
#depends=('alsa-lib' 'boost' 'boost-libs' 'cmake' 'curl' 'cvs' 'dbus-core' 'enca' 'faac' 'faad2' 'fontconfig' 'freetype2' 'fribidi' 'gd' 'glew' 'gperf' 'jasper' 'ldc' 'libass' 'libbluray' 'libcdio' 'libgl' 'libjpeg-turbo' 'libmad' 'libmicrohttpd' 'libmms' 'libmodplug' 'libmpeg2' 'libmysqlclient' 'libogg' 'libpng' 'libpulse' 'libsamplerate' 'libssh' 'libva' 'libvorbis' 'libxinerama' 'libxmu' 'libxrandr' 'libxrender' 'libxt' 'libxtst' 'lsb-release' 'lzo2' 'mesa' 'mesa-demos' 'moc' 'nasm' 'octave' 'openssl' 'pcre' 'pion-net' 'python2' 'python2-pysqlite' 'qmmp' 'rtmpdump' 'samba' 'sdl' 'sdl_gfx' 'sdl_image' 'sdl_mixer' 'smbclient' 'sqlite3' 'unzip' 'vlc' 'wavpack' 'xineramaproto' 'xorg-xdpyinfo' 'zip' 'swig' 'tinyxml' 'libcec' 'libplist' 'libshairport')
#makedepends=('git' 'openssh' 'doxygen')
options=(!strip)
conflicts=(xbmc plexmediacenter-git)

depends=('libpulse' 'hicolor-icon-theme' 'fribidi' 'ffmpeg-compat' 'lzo2' 'smbclient' 'libtiff' 'libva'
	 'libpng' 'libcdio' 'yajl' 'libmariadbclient' 'libjpeg-turbo' 'libsamplerate'
	 'glew' 'libssh' 'libmicrohttpd' 'libxrandr' 'sdl_mixer' 'sdl_image' 'python2'
	 'libass' 'libmpeg2' 'libmad' 'libmodplug' 'jasper' 'rtmpdump' 'unzip' 'mesa-demos'
	 'xorg-xdpyinfo' 'libbluray' 'libnfs' 'afpfs-ng' 'libshairport' 'avahi' 'bluez' 'glu'
	 'tinyxml' 'taglib')
makedepends=('boost' 'cmake' 'git' 'gperf' 'nasm' 'libxinerama' 'zip' 'libvdpau' 'libcec'
	     'udisks' 'upower' 'bluez' 'mesa' 'doxygen' 'swig' 'java-environment')
optdepends=('libcec: support for Pulse-Eight USB-CEC adapter'
	    'vdpau-video: accelerated video playback for nvidia cards'
	    'xvba-video: accelerated video playback for amd cards'
	    'pulseaudio: pulseaudio support'
	    'lirc: remote controller support'
	    'udisks: automount external drives'
	    'upower: used to trigger suspend functionality'
	    'unrar: access compressed files without unpacking them'
	    'xorg-xinit: autostart xbmc')
source=("$pkgname::git://github.com/plexinc/plex-home-theater-public.git")
md5sums=('SKIP')

prepare() {
  cd $srcdir/$pkgname
  sed -i 's:Utils/StringUtils.h:utils/StringUtils.h:g' $srcdir/$pkgname/plex/FileSystem/PlexDirectoryTypeParserVideo.cpp
  sed -i 's:client\(/PlexMediaServerClient.h\):Client\1:g' $srcdir/$pkgname/plex/GUI/GUIDialogPlexAudioSubtitlePicker.cpp
}

build() {
  cd $srcdir/$pkgname

  #numcpu="$(lscpu|awk '$1=="CPU(s):" {print $2}')"
  #[[ $MAKEFLAG != *-j[1-9]* ]] && MAKEFLAGS="-j$((numcpu + 1)) $MAKEFLAGS"
   ./bootstrap
   PYTHON_VERSION=2 \
   PKG_CONFIG_PATH=/usr/lib/ffmpeg-compat/pkgconfig:$PKG_CONFIG_PATH \
   ./configure --sbindir=/usr/bin --prefix=/usr --with-platform=Unix --enable-debug --enable-external-ffmpeg
    

   cmake . -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_C_COMPILER:FILEPATH="gcc" \
    -DCMAKE_C_FLAGS='-g' \
    -DCMAKE_CXX_FLAGS='-g' \
    -DCMAKE_CXX_COMPILER:FILEPATH="g++" \
    -DCMAKE_SKIP_RPATH=ON -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DFFMPEG_LIBAVCODEC_INCLUDE_DIRS=/usr/include/ffmpeg-compat \
    -DFFMPEG_LIBAVCODEC_LIBRARIES=/usr/lib/ffmpeg-compat/libavcodec.so \
    -DFFMPEG_LIBAVDEVICE_INCLUDE_DIRS=/usr/include/ffmpeg-compat \
    -DFFMPEG_LIBAVDEVICE_LIBRARIES=/usr/lib/ffmpeg-compat/libavdevice.so \
    -DFFMPEG_LIBAVFILTER_INCLUDE_DIRS=/usr/include/ffmpeg-compat \
    -DFFMPEG_LIBAVFILTER_LIBRARIES=/usr/lib/ffmpeg-compat/libavfilter.so \
    -DFFMPEG_LIBAVFORMAT_INCLUDE_DIRS=/usr/include/ffmpeg-compat \
    -DFFMPEG_LIBAVFORMAT_LIBRARIES=/usr/lib/ffmpeg-compat/libavformat.so \
    -DFFMPEG_LIBAVUTIL_INCLUDE_DIRS=/usr/include/ffmpeg-compat \
    -DFFMPEG_LIBAVUTIL_LIBRARIES=/usr/lib/ffmpeg-compat/libavutil.so \
    -DFFMPEG_LIBPOSTPROC_INCLUDE_DIRS=/usr/include/ffmpeg-compat \
    -DFFMPEG_LIBPOSTPROC_LIBRARIES=/usr/lib/ffmpeg-compat/libpostproc.so \
    -DFFMPEG_LIBSWRESAMPLE_INCLUDE_DIRS=/usr/include/ffmpeg-compat \
    -DFFMPEG_LIBSWRESAMPLE_LIBRARIES=/usr/lib/ffmpeg-compat/libswresample.so \
    -DFFMPEG_LIBSWSCALE_INCLUDE_DIRS=/usr/include/ffmpeg-compat \
    -DFFMPEG_LIBSWSCALE_LIBRARIES=/usr/lib/ffmpeg-compat/libswscale.so 
  make 
}

package() {
  cd $srcdir/$pkgname
  make -C "$srcdir/$pkgname" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
