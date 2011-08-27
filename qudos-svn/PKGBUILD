# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=qudos-svn
pkgver=344
pkgrel=2
pkgdesc="Enhanced Quake 2 engine"
arch=(i686 x86_64)
url="http://qudos.quakedev.com/"
license=('GPL')
# glib is required if compiling with xmms.
# Needs sdl to compile.
depends=('libjpeg' 'libpng' 'libvorbis' 'libxxf86vm' 'mesa' 'sdl')
makedepends=('subversion' 'xf86vidmodeproto')
provides=('qudos')
conflicts=('qudos')
install=qudos.install
source=(qudos.desktop)
md5sums=('b8be459dbd697855dfc8294c1c6a032b')

_svntrunk="svn://svn.quakedev.com/qudos/trunk"
_svnmod="trunk"
_gamedir="/usr/share/quake2"
_libdir="/usr/lib/qudos"

build() {
  cd $startdir/src

  msg "Checking for previous build"
  if [[ -d $_svnmod/.svn ]]; then
    msg "Retrieving updates"
    cd $_svnmod
    svn co $_svntrunk || return 1
  else
    msg "Retrieving complete sources"
    svn co $_svntrunk || return 1
    cd $_svnmod
  fi

  msg "Starting build"
  make clean || return 1

  # Favours OpenGL over SDL - it does not lose focus when audacious/xmms starts.
  # XMMS is disabled because the Makefile blindly assumes it is installed.
  # OSS works on x86_64.
  make \
    DATADIR=$_gamedir \
    LIBDIR=$_libdir \
    LOCALBASE=/usr \
    BUILD_GLX=YES \
    BUILD_OSS_SND=YES \
    BUILD_QUAKE2=YES \
    BUILD_GAME=YES \
    WITH_DATADIR=YES \
    WITH_LIBDIR=YES \
    WITH_XMMS=NO \
    || return 1

  if [ "$CARCH" == "x86_64" ]; then
    # Avoid "qudos: symbol lookup error: /usr/lib/games/qudos/snd_alsa.so: undefined symbol: Q_malloc".
    # These drivers get built regardless of the Makefile settings.
    rm -f quake2/snd_{alsa,sdl}.so
  fi

  mkdir -p $startdir/pkg/$_libdir
  cp -r quake2/* $startdir/pkg/$_libdir || return 1
  rm $startdir/pkg/$_libdir/QuDos

  install -D -m755 quake2/QuDos $startdir/pkg/usr/bin/qudos || return 1
  install -D -m644 data/qudos.pk3 $startdir/pkg/$_libdir/baseq2/qudos.pk3 || return 1

  # Desktop entry
  install -D -m644 src/unix/Q2.png $startdir/pkg/usr/share/pixmaps/qudos.png || return 1
  install -D -m644 $startdir/src/qudos.desktop $startdir/pkg/usr/share/applications/qudos.desktop || return 1

  # Docs
  mkdir -p $startdir/pkg/usr/share/doc/qudos
  cp docs/{QuDos,Ogg_readme,todo}.txt $startdir/pkg/usr/share/doc/qudos/ || return 1
}
