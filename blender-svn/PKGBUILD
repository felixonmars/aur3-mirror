# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: XercesBlue (nullfied)
# Contributor: Mikael Eriksson (miffe)
pkgname=blender-svn
pkgver=57894
pkgrel=1
pkgdesc="SVN version of Blender (called bf-blender)"
arch=('i686' 'x86_64')
url="http://blender.org/"
depends=('libgl' 'python' 'desktop-file-utils' 'hicolor-icon-theme'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openshadinglanguage' 'libtiff' 'libpng')
optdepends=('cuda: CUDA support in Cycles')
makedepends=('subversion' 'cmake' 'boost' 'mesa')
provides=('blender')
conflicts=('blender')
license=('GPL')
install=blender.install
source=('svn+https://svn.blender.org/svnroot/bf-blender/trunk/blender' \
        blender.desktop)
md5sums=('SKIP'
         'e9c26e370839fd902eb76c98fe3b9589')

# determine whether we can precompile CUDA kernels
_CUDA_PKG=`pacman -Qq cuda 2>/dev/null` || true
if [ "$_CUDA_PKG" != "" ]; then
    _EXTRAOPTS="-DWITH_CYCLES_CUDA_BINARIES=ON \
                -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda"
fi

pkgver() {
  cd "$srcdir/blender"
  svnversion | tr -d [A-z]
}

build() {
  mkdir -p "$srcdir/blender-build"
  cd "$srcdir/blender-build"

  cmake "$srcdir/blender" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_PLAYER=ON \
        -DWITH_FFTW3=ON \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_CODEC_FFMPEG=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION=3.3m \
        -DWITH_MOD_OCEANSIM=ON \
        $_EXTRAOPTS
  make
}

package() {
  cd "$srcdir/blender-build"
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir"/blender.desktop \
    "$pkgdir"/usr/share/applications/blender.desktop

  if [ -e "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/ ] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/*
  fi
}
