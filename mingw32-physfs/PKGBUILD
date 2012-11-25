# Maintainer: Andreas Krinke <andreas krinke gmx de>
# based on the PKGBUILD for physfs by:
#   Eric Belanger <eric@archlinux.org>
#   Bjorn Lindeijer <bjorn lindeijer nl>

pkgname=mingw32-physfs
pkgver=2.0.3
pkgrel=1
pkgdesc="A library to provide abstract access to various archives (mingw32)"
arch=('any')
url="http://icculus.org/physfs/"
license=('ZLIB')
makedepends=('mingw32-gcc' 'cmake')
depends=('mingw32-runtime' 'mingw32-zlib')
options=('!strip' '!buildflags')
source=(http://icculus.org/physfs/downloads/physfs-${pkgver}.tar.bz2
        win32.cmake)
md5sums=('c2c727a8a8deb623b521b52d0080f613'
         'ed1e275cf67dc9322f3a6e50e8ddc40c')

build() {
  cd "${srcdir}/physfs-${pkgver}"

  unset LDFLAGS

  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  export CXXFLAGS="$CXXFLAGS -fno-strict-aliasing"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr/i486-mingw32 \
    -DPHYSFS_BUILD_TEST=OFF \
    -DCMAKE_TOOLCHAIN_FILE=${srcdir}/win32.cmake
  make all
}

package() {
  cd "${srcdir}/physfs-${pkgver}"

  make DESTDIR="${pkgdir}" install
  
  install -D -m644 LICENSE.txt "${pkgdir}/usr/i486-mingw32/share/licenses/${pkgname}/LICENSE"
}
