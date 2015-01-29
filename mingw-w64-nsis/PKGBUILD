# Maintainer: Scott Furry <scott.wl.furry@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Andre Klitzing <andre () incubo () de>
_pkgname=nsis
pkgname=mingw-w64-${_pkgname}
pkgver=3.0b0
pkgrel=1
pkgdesc='A professional open source system to create Windows installers'
arch=('any')
url='http://nsis.sourceforge.net'
license='custom:zlib'
depends=('mingw-w64-zlib')
makedepends=('scons' 'mingw-w64-gcc' 'mingw-w64-binutils')
options=(!strip)
source=(http://downloads.sourceforge.net/project/nsis/NSIS%203%20Pre-release/$pkgver/$_pkgname-$pkgver-src.tar.bz2)
md5sums=('85b936c541c385ac98fbd77305b1803f')

_arch="i686-w64-mingw32"

build() {
  cd "$srcdir/$_pkgname-$pkgver-src"
  archbin="/usr/bin/${_arch}"
  export ZLIB_W32="/usr/${_arch}/"
  export ZLIB_W32_INC="/usr/${_arch}/include/"
  export ZLIB_W32_DLL="/usr/${_arch}/bin/"
  export ZLIB_W32_LIB="/usr/${_arch}/lib/"
  
  sed -i '/^def find(env)/a\    return "'`echo ${archbin}`'-"' SCons/Tools/crossmingw.py
  scons XGCC_W32_PREFIX=${_arch} \
      UNICODE=yes  \
      PREFIX_DEST="${srcdir}/$pkgname-build/" \
      PREFIX="/usr/${_arch}" \
      SKIPUTILS="NSIS Menu" install
}

package() {
  cp -ar ${srcdir}/$pkgname-build/* ${pkgdir}/
  install -Dm644 ${srcdir}/$_pkgname-$pkgver-src/Docs/src/license.but "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$srcdir/$_pkgname-$pkgver-src"
  export ZLIB_W32="/usr/${_arch}/"
  export ZLIB_W32_INC="/usr/${_arch}/include/"
  export ZLIB_W32_DLL="/usr/${_arch}/bin/"
  export ZLIB_W32_LIB="/usr/${_arch}/lib/"
  scons XGCC_W32_PREFIX=${_arch} \
      UNICODE=yes \
      PREFIX_DEST="$pkgdir/" \
      PREFIX="/usr/${_arch}" \
      SKIPUTILS="NSIS Menu" install
  # Add a symlink to 'makensis'
  mkdir "$pkgdir/usr/bin/"
  cd "$pkgdir/usr/bin/"
  ln -s ../${_arch}/bin/makensis
}
