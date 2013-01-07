# Contributor: Jason <jason52lh # gmail com>
pkgname=mplayer-mt-lite-git
pkgver=20130107
pkgrel=1
pkgdesc="A movie player for linux (Multithreaded, git version, use as much external libs as possible, such as ffmpeg)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.mplayerhq.hu/"

# set 1 to force mplayer not to use alsa-lib.
_noalsa=0

# depnds only you already have, others should contained in ffmpeg's depends.
[ "x$_noalsa" == "x0" ] && _alsa=$(pacman -Q alsa-lib 2>/dev/null | awk '{print $1}')
_smbclient=$(pacman -Q smbclient 2>/dev/null | awk '{print $1}')
_libxvmc=$(pacman -Q libxvmc 2>/dev/null | awk '{print $1}')
_faad2=$(pacman -Q faad2 2>/dev/null | awk '{print $1}')
_libpulse=$(pacman -Q libpulse 2>/dev/null | awk '{print $1}')

depends=('libjpeg' 'libmad' 'libxv' 'libxss' 'ffmpeg' 'libass' 'libdvdread' 'libgl' $_alsa $_smbclient $_libxvmc $_libpulse $_faad2)
makedepends=('mesa' 'git' 'yasm' 'live-media>=2010.01.13' 'python-docutils')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
provides=("mplayer")
conflicts=('mplayer')
replaces=()
install=mplayer.install
source=('mplayer.desktop' 'mplayer.png')
md5sums=(e47466075b85db7bbb432acaa253c75c 0ba60fdc9d7e9e73a844a3134925d66f)

_gitroot="git://repo.or.cz/mplayer.git"
_gitname="mplayer-mt"

build() {
  # Custom CFLAGS break the mplayer build
  unset CFLAGS
  unset LDFLAGS

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=2 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  cd $srcdir/$_gitname
  
  _options=""
  [ ! -z $_xvmc ] && _options="$_options --enable-xvmc"
  [ ! -z $_faad2 ] && _options="$_options --enable-faad"
  [ "x$_noalsa" == "x1" ] && _options="$_options --disable-alsa"
  
  ./configure --prefix=/usr --confdir=/etc/mplayer \
      --disable-runtime-cpudetection --yasm=yasm --language=all \
      --disable-libdv --disable-gif --disable-mng --disable-speex \
      --disable-libdca --disable-musepack \
      --disable-sdl --disable-caca \
      --disable-dvb --enable-xv \
      --disable-pulse --disable-jack --disable-openal \
      $_options

  [ "$CARCH" = "i686" ] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

  make
}
package(){
  cd $srcdir/$_gitname
  make -j1 DESTDIR=${pkgdir} install

  install -d ${pkgdir}/etc/mplayer/
  install -Dm644 etc/{codecs.conf,input.conf,example.conf} ${pkgdir}/etc/mplayer/
  install -Dm644 ${srcdir}/mplayer.png ${pkgdir}/usr/share/pixmaps/mplayer.png
  install -Dm644 ${srcdir}/mplayer.desktop ${pkgdir}/usr/share/applications/mplayer.desktop
}

