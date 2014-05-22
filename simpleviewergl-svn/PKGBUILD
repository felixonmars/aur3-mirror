# Contributor: Anton Kalugin aka strafer <strafer at ufaley dot su>
pkgname=simpleviewergl-svn
pkgver=139
pkgrel=2
pkgdesc="Simple image viewer using OpenGL for acceleration."
arch=('i686' 'x86_64')
url="http://www.ugolnik.info/?p=1302"
license=('GPL')
depends=('freeglut' 'freetype2' 'imlib2' 'libjpeg' 'libpng' 'giflib' 'zlib')
makedepends=('subversion' 'libconfig' 'cmake')
source=(formatgif.patch)
md5sums=(f3cc5df40084ef16d1e18c4eadea0feb)

_svntrunk="http://svn.code.sf.net/p/simpleviewer/code/"
_svnmod="simpleviewer-code"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server..."
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod && svn up
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi
  msg2 "SVN checkout done or server timeout"

  if [ -e "$srcdir"/$_svnmod-build ]; then
    msg "Remove old build directory..."
    rm -rf "$srcdir"/$_svnmod-build
  fi
  msg "Creating new build directory..."
  cp -r "$srcdir"/$_svnmod "$srcdir"/$_svnmod-build
  cd "$srcdir"/$_svnmod-build

  cd ./src/formats
  patch -p0 <"$srcdir"/formatgif.patch
  cd ../..

  mkdir build
  cd build

  msg "Starting cmake..."
  cmake ../

  msg "Starting make..."
  make
}

package() {
  cd "$srcdir"/$_svnmod-build

  install -Dm 755 sviewgl $pkgdir/usr/bin/sviewgl
}
# vim:set ts=2 sw=2 et:
