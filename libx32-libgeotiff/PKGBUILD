# $Id: PKGBUILD 78991 2012-10-28 17:33:18Z jlichtblau $
# Upstream Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=libgeotiff
pkgname=libx32-libgeotiff
pkgver=1.4.0
pkgrel=1.1
pkgdesc="A TIFF based interchange format for georeferenced raster imagery (x32 ABI)"
arch=('x86_64')
license=('custom')
url="http://www.remotesensing.org/geotiff"
depends=('libx32-libtiff' 'libx32-proj' 'libx32-libjpeg>=7' "${_basepkgname}=${pkgver}")
makedepends=('gcc-multilib-x32')
options=('!makeflags' '!libtool')
changelog=$pkgname.changelog
source=(ftp://ftp.remotesensing.org/pub/geotiff/libgeotiff/$_basepkgname-$pkgver.tar.gz)
sha256sums=('d0acb8d341fd6a8f2c673456e09fdb8f50f91e3166ac934719fe05b30d328329')

build() {
  cd ${srcdir}/$_basepkgname-$pkgver

  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/libx32
  make
}

package() {
  cd ${srcdir}/$_basepkgname-$pkgver

  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin}

  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s ${_basepkgname} "${pkgdir}"/usr/share/licenses/${pkgname}
}
