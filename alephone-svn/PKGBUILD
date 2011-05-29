# Maintainer: Marcin Skory <armitage at gfreedom dot org>
pkgname=alephone-svn
pkgver=4397
pkgrel=2
pkgdesc='A free, enhanced port of the classic FPS "Marathon 2" by Bungie Software (SVN version)'
arch=('i686' 'x86_64')
url="http://marathon.sourceforge.net/"
license=('GPL')
depends=('sdl_ttf' 'libmad' 'libsndfile' 'libvorbis' 'mesa' 'sdl_image' 'sdl_net' 'smpeg' 'speex' 'zziplib')
makedepends=('subversion' 'boost' 'lua>=5.1')
provides=('alephone')
conflicts=('alephone')

_svntrunk=https://marathon.svn.sourceforge.net/svnroot/marathon/trunk
_svnmod=marathon

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # Build procedure
  ./autogen.sh
  sed "s/PACKAGE='AlephOne'/PACKAGE='alephone'/g" -i configure
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}
