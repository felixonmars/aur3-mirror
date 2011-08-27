# Contributor: Changaco <changaco ατ changaco δοτ net>

pkgname=ffmpeg2theora-svn
pkgver=1
pkgrel=3
pkgdesc="A simple converter to create Ogg Theora files - development version"
arch=('i686' 'x86_64')
url="http://v2v.cc/~j/ffmpeg2theora/"
license=('GPL')
depends=('libtheora-svn' 'ffmpeg-svn' 'libkate')
makedepends=('subversion' 'scons')
provides=("ffmpeg2theora=$pkgver")
conflicts=('ffmpeg2theora')
source=()
md5sums=()

_svntrunk=http://svn.xiph.org/trunk
_svnmod=ffmpeg2theora

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk/$_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_svnmod"
  mkdir ${pkgdir}/usr
  scons install prefix=${pkgdir}/usr
}
