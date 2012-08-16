# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Paul Bienkowski <opatutlol@aol.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
pkgname=('mingw32-bullet')
_pkgbasename=bullet
pkgver=2.80
pkgrel=1
pkgdesc="A 3D Collision Detection and Rigid Body Dynamics Library for games and  animation (mingw32)"
arch=('any')
url="http://www.bulletphysics.com/Bullet/"
license=('custom:zlib')
depends=('mingw32-binutils' 'mingw32-runtime')
options=(!strip !buildflags)
makedepends=('cmake' 'freeglut' 'mingw32-gcc')
source=(http://bullet.googlecode.com/files/${_pkgbasename}-${pkgver}-rev2531.tgz
        ${_pkgbasename}.pc
        cmake-toolchain.cmake)
md5sums=('d1eec0332110264a21d0fc0f2fb127c3'
         '0e13789dc20d32112a6dfd2ac2bdebfb'
         'dd2b2db48187dff84050fe191d309d81')

build() {
  cd ${_pkgbasename}-${pkgver}-rev2531

  # get a clean build dir
  [[ -d build ]] && rm -rf build
  mkdir build && cd build 

  unset LDFLAGS
  # generate CMake Makefile
  cmake .. \
       -DCMAKE_INSTALL_PREFIX=/usr/i486-mingw32 \
       -DCMAKE_TOOLCHAIN_FILE=${srcdir}/cmake-toolchain.cmake  \
       -DBUILD_SHARED_LIBS=1 \
       -DBUILD_DEMOS=0 \
       -DBUILD_EXTRAS=1 \
       -DINSTALL_LIBS=1 \
       -DUSE_GLUT=0 \
       -DINSTALL_EXTRA_LIBS=1 \
       -DCMAKE_BUILD_TYPE=Release # set =Debug for debugging version

  # compile
  make
}

package() {
  optdepends=('bullet-docs: documentation')

  cd ${_pkgbasename}-${pkgver}-rev2531/build

  # install it
  make DESTDIR=${pkgdir} install

  # manually handle pkgconfig file
  mkdir -p "${pkgdir}"/usr/i486-mingw32/lib/pkgconfig
  sed "s|VERSION|${pkgver}|g" ${srcdir}/bullet.pc > ${pkgdir}/usr/i486-mingw32/lib/pkgconfig/bullet.pc

  # install license
  install -Dm644 ../BulletLicense.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  mkdir -p $pkgdir/usr/i486-mingw32/bin
  mv $pkgdir/usr/i486-mingw32/lib/*.dll $pkgdir/usr/i486-mingw32/bin/
}

# vim: sw=2 ts=2 et:
