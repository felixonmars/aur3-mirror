# Contributor: nknikolov <nknikolov[at]googlemail[dot]com>

pkgname=cdg2video-svn
pkgver=15
pkgrel=1
pkgdesc="cdg2video is a command line tool for converting karaoke CDG+MP3/OGG/FLAC files to a video. "
arch=('i686' 'x86_64')
url="http://code.google.com/p/cdg2video/"
license=('GPL')
depends=('ffmpeg' 'libzip')
makedepends=('subversion' 'cmake')
provides=("cdg2video=`date +%Y%m%d`")
conflicts=('cdg2video')
source=()
md5sums=()

_svntrunk=http://cdg2video.googlecode.com/svn/trunk
_svnmod=cdg2video

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  cd "$_svnmod"
  cmake . || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
