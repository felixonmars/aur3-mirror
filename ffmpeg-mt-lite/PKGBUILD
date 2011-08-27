# Contributor: Jason <jason52lh # gmail com>
pkgname=ffmpeg-mt-lite
pkgver=20110226
pkgrel=1
pkgdesc="Complete and free Internet live audio and video broadcasting solution for Linux/Unix (Multithread build, git version, needed by mplayer-mt)"
arch=('i686' 'x86_64')
url="http://ffmpeg.mplayerhq.hu/"
license=('GPL')

# set 1 to force not to use alsa libs
_noalsa=0

# depend on only what you already have
[ "x$_noalsa" == "x0" ] && _alsa=$(pacman -Q alsa-lib 2>/dev/null | awk '{print $1}')
_xvidcore=$(pacman -Q xvidcore 2>/dev/null | awk '{print $1}')
_faac=$(pacman -Q faac 2>/dev/null | awk '{print $1}')
_libvpx=$(pacman -Q libvpx 2>/dev/null | awk '{print $1}')
_lame=$(pacman -Q lame 2>/dev/null | awk '{print $1}')
_libvdpau=$(pacman -Q libvdpau 2>/dev/null | awk '{print $1}')
_x264=$(pacman -Q x264 2>/dev/null | awk '{print $1}')

depends=('zlib' 'libxext' 'libxfixes' 'libvorbis' 'libtheora' $_x264 $_xvidcore $_libvpx $_faac $_lame $_alsa)
makedepends=('git' 'yasm')
provides=("ffmpeg")
conflicts=('ffmpeg')
source=()
md5sums=()

_gitroot="git://repo.or.cz/FFMpeg-mirror/mplayer-patches.git"
_gitname="ffmpeg-mt"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
    git checkout --track -b mt origin/mt
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  
  cd "$srcdir/$_gitname"
  rm -rf libswscale/
  git submodule init
  git submodule update
  
  _options=""
  [ ! -z $_xvidcore ] && _options="$_options --enable-libxvid"
  [ ! -z $_x264 ] && _options="$_options --enable-libx264"
  [ ! -z $_faac ] && _options="$_options --enable-libfaac"
  [ ! -z $_lame ] && _options="$_options --enable-libmp3lame"
  [ ! -z $_libvpx ] && _options="$_options --enable-libvpx"
  [ "x$_noalsa" == "x1" ] && _options="$_options --disable-outdev=alsa"

  ./configure \
      --prefix=/usr --enable-shared --enable-pthreads --arch=`uname -m` \
      --enable-gpl --enable-version3 --enable-nonfree --enable-postproc \
      --enable-libvorbis --enable-libtheora --enable-x11grab $_options

  make || return 1
  make doc/ff{mpeg,server}.1 || return 1
}
package(){
  cd ${srcdir}/$_gitname
  make DESTDIR="$pkgdir" install || return 1
  make DESTDIR="$pkgdir" install-man || return 1
  rm `find $pkgdir -name "*.a"`
}
