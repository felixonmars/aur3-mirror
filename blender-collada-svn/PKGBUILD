# Maintainer: Mad Fish <MadFishTheOne@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: XercesBlue (nullfied)
# Contributor: Mikael Eriksson (miffe)
pkgname=blender-collada-svn
pkgver=32657
pkgrel=1
pkgdesc="SVN version of Blender with COLLADA support"
arch=('i686' 'x86_64')
url="http://blender.org/"
depends=('libpng' 'libgl' 'mesa' 'openexr' 'python' 'desktop-file-utils' 'libsamplerate'
         'hicolor-icon-theme' 'ffmpeg' 'fftw' 'lcms' 'openal' 'freetype2' 'libxi' 'pcre' 'expat')
makedepends=('subversion' 'yasm' 'cmake' 'scons')
provides=('blender')
conflicts=('blender' 'blender-svn')
license=('GPL')
install=blender.install
source=(blender.desktop)
md5sums=('e9c26e370839fd902eb76c98fe3b9589')

_svntrunk="https://svn.blender.org/svnroot/bf-blender/trunk/blender"
_svnmod="blender"

build() {
  # get the sources
  cd "$srcdir"
  msg "Connecting to Blender SVN server......."
  if [ -d $_svnmod/.svn ]; then
  	cd $_svnmod && svn up -r $pkgver
  else
  	svn co $_svntrunk -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  cd "$srcdir"
  msg "Connecting to OpenCOLLADA SVN server......."
  if [ -d opencollada/.svn ]; then
  	cd opencollada && svn up
  else
  	svn co http://opencollada.googlecode.com/svn/trunk/ opencollada
  fi
  msg "SVN checkout done or server timeout"

  msg "Building OpenCOLLADA..."
  cd "$srcdir"/opencollada
  scons RELEASE=1 XMLPARSER=expatNative
  rm -rf lib
  mkdir lib
  find . -iname "*.a" | xargs cp -vt lib

  msg "Building Blender..."
  cd "$srcdir"/$_svnmod

  ##########
  [ -e "$srcdir"/$_svnmod-build ] || mkdir -p "$srcdir"/$_svnmod-build
  cd "$srcdir"/$_svnmod-build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_LCMS=ON \
        -DWITH_FFTW3=ON \
        -DWITH_FFMPEG=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DWITH_OPENCOLLADA=ON \
        -DOPENCOLLADA="$srcdir"/opencollada \
        "$srcdir"/$_svnmod
  make
  ##########
  # now compile some plugins
  cp -rf "$srcdir"/$_svnmod/release/plugins/* \
    "$srcdir"/$_svnmod/source/blender/blenpluginapi/
  cd "$srcdir"/$_svnmod/source/blender/blenpluginapi
  chmod 755 bmake
  make
}

package() {
  cd "$srcdir"/$_svnmod-build
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir"/blender.desktop \
    "$pkgdir"/usr/share/applications/blender.desktop

  # install plugins
  install -d -m755 "$pkgdir"/usr/share/blender/`ls "$pkgdir"/usr/share/blender`/plugins/{sequence,texture}
  cp "$srcdir"/$_svnmod/source/blender/blenpluginapi/sequence/*.so \
    "$pkgdir"/usr/share/blender/*/plugins/sequence/
  cp "$srcdir"/$_svnmod/source/blender/blenpluginapi/texture/*.so \
    "$pkgdir"/usr/share/blender/*/plugins/texture/
}
