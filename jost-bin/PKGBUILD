# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=jost
[ "$CARCH" = 'x86_64' ] && _lib=lib32-
pkgname=$_pkg-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="A multi technology (vst / ladspa / dssi) native host for linux"
arch=(i686 x86_64)
url="http://www.anticore.org/jucetice/?page_id=4"
license=('LGPL')
depends=("${_lib}libxext" "${_lib}jack" "${_lib}alsa-lib" "${_lib}freetype2")
provides=("$_pkg")
conflicts=("$_pkg")
options=('!strip')
install="$pkgname.install"
source=("http://www.anticore.org/jucetice/get.php?file=$_pkg-v$pkgver.tar.bz2"
        "$_pkg.desktop" "$_pkg.png")
md5sums=('b1e1efe941d157d0f89e29bc0c5f07a7'
         'b3d012b332026b4af8f959ca5b1605a7'
         '4a2b89b67d442806c0426efed29377ae')

build() {
  return 0
}

package() {
  cd "$srcdir/$_pkg-v$pkgver"

  # bin
  install -Dm755 $_pkg "$pkgdir/usr/bin/$_pkg"

  # lib
  install -Dm755 ${_pkg}vst.so "$pkgdir/usr/lib/${_pkg}vst.so"

  # desktop file
  install -Dm644 ../$_pkg.desktop \
    "$pkgdir/usr/share/applications/$_pkg.desktop"

  # icon
  install -Dm644 ../$_pkg.png \
    "$pkgdir/usr/share/pixmaps/$_pkg.png"
}

# vim:set ts=2 sw=2 et:
