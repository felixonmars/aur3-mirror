# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: XercesBlue (nullfied)
# Contributor: Mikael Eriksson (miffe)
# Contributor: mosra <mosra@centrum.cz>
# PKGBUILD stolen from blender-svn
pkgname=blender-freestyle-svn
pkgver=51468
pkgrel=1
pkgdesc="SVN version of Blender (branch with FreeStyle edge rendering)"
arch=('i686' 'x86_64')
url="http://blender.org/"
depends=('libgl' 'mesa' 'python' 'desktop-file-utils' 'hicolor-icon-theme'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio')
optdepends=('cuda-toolkit: CUDA support in Cycles')
makedepends=('subversion' 'cmake' 'boost')
provides=('blender')
conflicts=('blender')
license=('GPL')
install=blender.install
source=(blender.desktop)
md5sums=('9acbd59bdf4cda404e1c59f343372fd9')

_svntrunk="https://svn.blender.org/svnroot/bf-blender/branches/soc-2008-mxcurioni/"
_svnmod="blender"

# determine whether we can precompile CUDA kernels
_CUDA_PKG=`pacman -Qq cuda-toolkit 2>/dev/null` || true
if [ "$_CUDA_PKG" != "" ]; then
    _EXTRAOPTS="-DWITH_CYCLES_CUDA_BINARIES=ON \
                -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda-toolkit"
fi

build() {
  # get the sources
  cd "$srcdir"
  msg "Connecting to Blender SVN server......."
  if [ -d $_svnmod/.svn ]; then
  	cd $_svnmod && svn up -r $pkgver
  else
  	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  msg "Starting make..."
  cd "$srcdir"/$_svnmod

  [ -e "$srcdir"/$_svnmod-build ] || mkdir -p "$srcdir"/$_svnmod-build
  cd "$srcdir"/$_svnmod-build
  cmake "$srcdir"/$_svnmod \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_PLAYER=ON \
        -DWITH_FFTW3=ON \
        -DWITH_BUILTIN_GLEW=OFF \
        -DWITH_CODEC_FFMPEG=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION=3.3m \
        -DWITH_MOD_OCEANSIM=ON \
        $_EXTRAOPTS
  make
}

package() {
  cd "$srcdir"/$_svnmod-build
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir"/blender.desktop \
    "$pkgdir"/usr/share/applications/blender.desktop

  if [ -e "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/ ] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/*
  fi
}
