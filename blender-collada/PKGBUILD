# Contributor: John Sowiak <john@archlinux.org>
# Original Maintainer: tobias <tobias@archlinux.org>
# Maintainer: Liganic <liganic-aur@gmx.net>

# This PKGBUILD is a slightly modified version of the blender PKGBUILD to activate opencollada support

# Apparently, the blender guys refuse to release source tarballs for
# intermediate releases that deal mainly with binaries but incorporate tiny
# minor changes from svn. Since I'm sick and tired of the urges of users that
# look for release numbers only, we make a messy PKGBUILD that can checkout svn
# release if necessary.

#_svn=true
_svn=false

pkgname=blender-collada
_pkgname=blender
provides=blender
conflicts=blender
pkgver=2.60a
pkgrel=2
epoch=3
pkgdesc="A fully integrated 3D graphics creation suite. With Collada support."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.blender.org"
depends=('libpng' 'libtiff' 'openexr' 'python' 'desktop-file-utils' \
         'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils' 'glew' \
         'freetype2' 'openal' 'libsndfile' 'ffmpeg' 'opencollada')
makedepends=('cmake') # 'subversion'
install=blender.install
if [ $_svn = false ]; then
  source=(http://download.blender.org/source/$_pkgname-$pkgver.tar.gz)
  md5sums=('cc7e4a56c9f7941c33c958ff0338f9a6')
else
  source=(ftp://ftp.archlinux.org/other/${_pkgname}/$_pkgname-$pkgver.tar.xz)
  md5sums=('7579d1139d0d6025df8afcfca64a65c4')
fi

# source PKGBUILD && mksource
mksource() {
  [[ -x /usr/bin/svn ]] || (echo "svn not found. Install subversion." && return 1)
  _svnver=38016
  _svntrunk="https://svn.blender.org/svnroot/bf-blender/trunk/blender"
  _svnmod="$_pkgname-$pkgver"
  mkdir ${_pkgname}-$pkgver
  pushd ${_pkgname}-$pkgver
  svn co $_svntrunk --config-dir ./ -r $_svnver $_svnmod
  find . -depth -type d -name .svn -exec rm -rf {} \;
  tar -cJf ../${_pkgname}-$pkgver.tar.xz ${_pkgname}-$pkgver/*
  popd
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
	rm -rf build
  mkdir build
  cd build

  [[ $CARCH == i686 ]] && ENABLESSE2="-DSUPPORT_SSE2_BUILD:BOOL=OFF"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DWITH_INSTALL_PORTABLE:BOOL=OFF \
    -DWITH_PYTHON_INSTALL:BOOL=OFF \
    -DWITH_OPENCOLLADA:BOOL=ON \
    -DWITH_GAMEENGINE:BOOL=ON \
    -DWITH_PLAYER:BOOL=ON \
    -DWITH_BUILTIN_GLEW:BOOL=OFF \
    -DWITH_CODEC_FFMPEG:BOOL=ON \
    -DWITH_CODEC_SNDFILE:BOOL=ON \
    -DPYTHON_VERSION:STRING=3.2 \
    -DPYTHON_LIBPATH:STRING=/usr/lib \
    -DPYTHON_LIBRARY:STRING=python3.2mu \
    -DPYTHON_INCLUDE_DIRS:STRING=/usr/include/python3.2mu \
    $ENABLESSE2

  make $MAKEFLAGS

  cp -rf "$srcdir"/${_pkgname}-$pkgver/release/plugins/* \
    "$srcdir"/${_pkgname}-$pkgver/source/blender/blenpluginapi/
  cd "$srcdir"/${_pkgname}-$pkgver/source/blender/blenpluginapi
  chmod 755 bmake
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install
  python -m compileall "${pkgdir}/usr/share/blender"

# install plugins
  install -d -m755 "$pkgdir"/usr/share/blender/${pkgver%[a-z]}/plugins/{sequence,texture}
  cp "$srcdir"/${_pkgname}-$pkgver/source/blender/blenpluginapi/sequence/*.so \
    "$pkgdir"/usr/share/blender/${pkgver%[a-z]}/plugins/sequence/
  cp "$srcdir"/${_pkgname}-$pkgver/source/blender/blenpluginapi/texture/*.so \
    "$pkgdir"/usr/share/blender/${pkgver%[a-z]}/plugins/texture/
}
