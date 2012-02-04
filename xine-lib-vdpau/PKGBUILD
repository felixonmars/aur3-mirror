# Contributor: Kosava <kosava@gmail.com>

pkgname=xine-lib-vdpau
pkgver=286
pkgrel=1
pkgdesc="A free video player for Unix with vdpau support"
arch=('any')
url="http://www.xine-project.org/"
license=('GPL')
depends=()
makedepends=('subversion' 'libxvmc' 'libvdpau' 'audiofile' 'esound' 'libogg' 'flac' 'libvorbis' 'sdl' 'libjpeg' 'libmng' 'libtheora' 'wavpack' 'a52dec' 'lame' 'faad2' 'libmp4v2' 'faac' 'xvidcore' 'libtiff' 'giflib' 'libid3tag' 'imlib2' 'x264' 'ffmpeg' 'cvs' 'heimdal' 'pkgconfig' 'vcdimager' 'jack-audio-connection-kit')
provides=('xine-lib')
conflicts=('xine-lib')
source=()
md5sums=()

_svntrunk=svn://jusst.de/xine-vdpau
_svnmod=xine-vdpau

build() {

  ## start building
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod
  
  ## clear tmp
  make clean

  ./autogen.sh --prefix=/usr

  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}