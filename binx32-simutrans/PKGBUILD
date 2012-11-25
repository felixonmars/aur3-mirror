# $Id: PKGBUILD 79166 2012-10-31 05:49:16Z bgyorgy $
# Upstream Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Gilles Gagniard <gilles@gagniard.org>
# Contributor: JD Steffen <jd at steffennet dot org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=simutrans
pkgname=binx32-simutrans
pkgver=112.0
_pkgver=112-0
pkgrel=1.1
pkgdesc="An open source transportation simulation game (x32 ABI)"
arch=('x86_64')
url="http://simutrans.com/"
license=('PerlArtistic')
depends=('libx32-gcc-libs' 'libx32-zlib' 'libx32-sdl_mixer' 'libx32-bzip2' 'simutrans-pak64' "${_basepkgname}=${pkgver}")
makedepends=('imagemagick' 'gcc-multilib-x32')
source=(http://downloads.sourceforge.net/$_basepkgname/$_basepkgname-src-$_pkgver.zip
        settings-folder.patch
        path-for-game-data.patch
        config.patch
	fix-build.patch
        simutrans.desktop)
md5sums=('d7d470b05cee33a31ad30252e53529d8'
         'c87d9a9910bc371df5d50f7f1ec298bb'
         '4648680290b44775b9c47d3758d3bd6c'
         '667a569cc86ea44fb1937e2999f99a19'
         '7d6329f7db821e3cc22fde5c5c138e2d'
         '14b78ea58436de81730c919d43579650')

build() {
  cd "$srcdir"

  cp config.template config.default
  patch -Np0 -i "$srcdir/settings-folder.patch"
  patch -Np1 -i "$srcdir/path-for-game-data.patch"
  patch -Np0 -i "$srcdir/config.patch"
  patch -Np0 -i "$srcdir/fix-build.patch"
  convert simutrans.ico -alpha on simutrans.png
  chmod 644 simsys_opengl.cc

  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  make
}

package() {
  cd "$srcdir"

  #binary
  install -Dm755 build/default/sim "$pkgdir/usr/bin/simutrans-x32"

  #desktop file and icon
  install -Dm644 simutrans.desktop "$pkgdir/usr/share/applications/simutrans-x32.desktop"
}
