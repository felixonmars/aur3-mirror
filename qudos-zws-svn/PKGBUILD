# Maintainer: Redderick Shohart <s.sovetnik@gmail.com>

pkgname=qudos-zws-svn
pkgver=20121005
pkgrel=1
pkgdesc="Enhanced Quake 2 engine, forked by ZwS, with yamagi's fixes, and some minor patches to prevent libjpeg and zlib compilling errors. svn version"
arch=(i686)
url="https://github.com/ZwS/qudos"
license=('GPL')
# Needs sdl to compile.
depends=('libjpeg' 'libpng' 'libvorbis' 'libxxf86vm' 'mesa' 'sdl')
optdepends=('libpng-old: in case of libpng errors')
makedepends=('xf86vidmodeproto')
provides=('qudos')
conflicts=('qudos')
install=qudos.install
source=(https://dl.dropbox.com/u/43220776/Q2.png
	qudos.desktop	
	qudos.install
	https://dl.dropbox.com/u/43220776/QuDosmaX-0.40.1.tar.bz2
	https://dl.dropbox.com/u/43220776/gl_rmisc.patch)
        md5sums=('e454a9fa13ca81cf155a65f6089a6b20'
	'b8be459dbd697855dfc8294c1c6a032b'	
	'1c040c8589ce24a0abe8453f37dcf4b5'
        '43872123620e605638cc011dee03ea48'
	'4750a0776c3d3d4ab568b523b6881fa6')

_gamedir="/usr/share/quake2"
_libdir="/usr/lib/qudos"
_basedir="/usr/share/quake2"
_gitroot="git://github.com/ZwS/qudos.git"
_gitname="ZVS-qudos"


build() {
	msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."	

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  
	cd "$srcdir/$_gitname-build"	
	patch -i $startdir/gl_rmisc.patch src/ref_gl/gl_rmisc.c
	
	# Favours OpenGL over SDL - it does not lose focus when audacious/xmms starts.
	# XMMS is disabled because the Makefile blindly assumes it is installed.
	# OSS works on x86_64.
  make \
    DATADIR=$_gamedir \
    LIBDIR=$_libdir \
    LOCALBASE=/usr \
    BUILD_GLX=YES \
    BUILD_SDLGL=YES \
    BUILD_OSS_SND=YES \
    BUILD_ALSA_SND=YES \
    BUILD_QUAKE2=YES \
    BUILD_GAME=YES \
    WITH_DATADIR=YES \
    WITH_LIBDIR=YES \
    WITH_XMMS=NO \
    X11BASE=/usr/X11\
|| return 1

  mkdir -p $startdir/pkg/$_libdir
  cp -r $srcdir/quake2/* $startdir/pkg/$_libdir || return 1
  install -D -m755 qudos/QuDos $startdir/pkg/usr/bin/qudos || return 1
  install -D -m644 $srcdir/$_gitname/quake2/baseq2/qudos.pk3 $startdir/pkg/$_basedir/baseq2/qudos.pk3 || return 1

  # Desktop entry
  install -D -m644 $startdir/Q2.png $startdir/pkg/usr/share/pixmaps/qudos.png || return 1
  install -D -m644 $startdir/src/qudos.desktop $startdir/pkg/usr/share/applications/qudos.desktop || return 1

  # Docs
  mkdir -p $startdir/pkg/usr/share/doc/qudos
  cp docs/{QuDos,Ogg_readme,todo}.txt $startdir/pkg/usr/share/doc/qudos/ || return 1
}
