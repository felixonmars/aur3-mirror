# Maintainer: rtfreedman (rob<d0t>til<d0t>freedman<aT>gmail<d0t>com
# 
# This build script uses (persistent) git repositories (ffmpeg-git, mpv-git and libass-git)
# located where PKGBUILD resides - gcc is used by default, but can be changed to clang easily.
#
# It is heavily commented and configured without seldom used features by default
#
# use 'makepkg &>mpv.log' to get a log file of the build
#
# if you need features not autodetected, use 
# 'src/mpv-build/mpv/configure --help' and
# 'src/mpv-build/ffmpeg/configure --help' 
#

pkgname=mpv-player-git
_gitname="mpv-build"
pkgver=35827
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2 (uses ffmpeg,libass,fribidi from git)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://mpv.io/"
#
# check log file for auto detected libs; you can use --disable-xxx to disable auto detection
#
depends=('desktop-file-utils' 'enca' 'harfbuzz' 'lame' 'libbluray' 'libcdio-paranoia' 'lcms2' 
		'libdvdread' 'libguess' 'libmng' 'libpulse' 'libquvi' 'libva' 'libvpx' 'libxinerama' 
		'libxss' 'libxv' 'mpg123'  'rtmpdump' 'x264')
#
# for using clang instead of gcc, remove 'gcc' and replace it with gcc further down 
# in CC=clang and --cc=clang or reverse it later again
#
makedepends=('git' 'mesa' 'python-docutils' 'yasm') #'clang' 
#
conflicts=('mpv' 'mpv-git' 'mpv-build-git')
install="mpv-player.install"
#
# git repositories outside of src/ are persistent and allows for faster rebuilds ;)
#
source=('git://github.com/mpv-player/mpv-build.git'
		'git+http://github.com/mpv-player/mpv#branch=master'
        'git://source.ffmpeg.org/ffmpeg.git'
        'git+https://code.google.com/p/libass'
        'git://anongit.freedesktop.org/fribidi/fribidi.git'
        'mpv.desktop')
md5sums=(SKIP SKIP SKIP SKIP SKIP
         '0ff83929010f5a71bda77772141ab347')
         
#   mpv#branch=master        'git://github.com/mpv-player/mpv.git'

pkgver() {
  cd mpv
  # get a plain number
  echo $(git rev-list --count master) 
}

prepare() {
  cd "${_gitname}"
  rm -fr mpv ffmpeg libass fribidi ffmpeg_build build_libs
  # pacman puts them into src/, we move them into place
  mv ../{mpv,ffmpeg,libass,fribidi} .
  #
  # skip docs (needs c2man) & test
  sed 's|= gen.tab charset lib bin doc test|= gen.tab charset lib bin|' \
	-i fribidi/Makefile.am

  # missing include
  sed 's|build_libs/include|build_libs/include:/usr/include/glib-2.0|' \
	-i scripts/libass-config
  #
  # ffmpeg build flags -- please take notice of default '--enable-nonfree' in ffmpeg
  # --enable-xxx enables additional codecs, see [no] labeled options in 'src/mpv-build/ffmpeg/configure --help' 
  #
  # enable: VP8 and VP9 de/encoding via libvpx, H.264 encoding via x264, MP3 encoding via libmp3lame
  # disable building ffmpeg programs not used by mpv-player
  # we need to set the compiler for ffmpeg explicitly: --cc=gcc|clang
  #
  sed 's|OPTIONS="|OPTIONS="--cc=gcc --disable-programs --enable-libx264 --enable-libvpx --enable-librtmp --enable-libmp3lame --enable-libass --enable-libfreetype  --disable-runtime-cpudetect |' \
	-i scripts/ffmpeg-config

  # mpv build flags are mostly autodetected
  # remove --disable-xxx to enable auto detection, see 'src/mpv-build/mpv/configure --help'
  # use --disable-encoding (and remove --enable-xxx in ffmpeg) for playing only & reduced foot print
  # --disable-vstream 
  sed 's|OPTIONS="|OPTIONS="--prefix=/usr --confdir=/etc/mpv --disable-wayland \
   --extra-cflags=-I/usr/include/samba-4.0  --disable-smb --disable-rsound --disable-caca \
   --disable-ladspa --disable-jack --disable-portaudio  --disable-libbs2b \
   --disable-sdl --disable-sdl2 --disable-lirc --disable-lircc |' \
	-i scripts/mpv-config
}

build() {
  cd "${_gitname}"
  # either use CC=clang|gcc
  export CC=gcc
  make
}

package() {
  cd "${_gitname}/mpv"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/mpv.desktop" "${pkgdir}/usr/share/applications/mpv.desktop"
  install -Dm644 etc/mplayer.xpm "${pkgdir}/usr/share/pixmaps/mpv.xpm"

  # media file identification script 
  install -m755 TOOLS/mpv_identify.sh "${pkgdir}/usr/bin"
  
  # sample config files
  install -d "${pkgdir}"/{etc/mpv,usr/share/doc/mpv}
  install -Dm644 etc/input.conf "${pkgdir}/etc/mpv/input.conf-example"
  install -Dm644 etc/example.conf "${pkgdir}/etc/mpv/mpv.conf-example"
  install -Dm644 etc/encoding-example-profiles.conf "${pkgdir}/etc/mpv/encoding-profiles.conf"
  
  # fix up to get consistent documentation
  sed -i 's|/usr/local/etc/mpv.conf|/etc/mpv.conf|' "${pkgdir}/etc/mpv/mpv.conf-example"
  
  # either copy /etc/mpv/mpv.conf-example to ~/.mpv/mpv.conf or rename it to /etc/mpv/mpv.conf
  # in any case /etc/mpv/encoding-profiles.conf gets included by default
  sed -i 's|/path/to/the/file/you/want/to/include|/etc/mpv/encoding-profiles.conf|' \
	"${pkgdir}/etc/mpv/mpv.conf-example"
  
  install -Dm644 Copyright DOCS/tech-overview.txt "${pkgdir}/usr/share/doc/mpv"
}
