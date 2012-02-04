# Maintainer: Karim DRIDI <karim.dridi@arykow.com>
pkgname=devkitppc-portlibs-chipmunk
pkgver=6.0.2
pkgrel=1
pkgdesc='Chipmunk is a fast and lightweight 2D rigid body physics library written in C'
arch=('i686' 'x86_64')
url='http://chipmunk-physics.net/'
license=('custom')
options=(!strip libtool)
depends=('devkitppc')
makedepends=('cmake')
source=("http://chipmunk-physics.net/release/Chipmunk-6.x/Chipmunk-${pkgver}.tgz")
md5sums=('c1b7917e7ce2160fa2d5305a451b152c')

build() {
	source /etc/profile.d/devkitppc.sh
	export DEVKITPRO="${pkgdir}/opt/devkitpro"

	cd "${srcdir}/Chipmunk-${pkgver}"
  sed -i '/MAKE_PROPERTIES_REF(cpShape, IsSensor);/d' include/chipmunk/chipmunk_ffi.h

  cmake -DCMAKE_INSTALL_PREFIX=${DEVKITPRO}/portlibs/ppc \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_DEMOS=OFF \
    -DBUILD_SHARED=OFF \
    -DBUILD_STATIC=ON \
    -DINSTALL_DEMOS=OFF \
    -DINSTALL_STATIC=ON \
    -DCMAKE_C_COMPILER="/opt/devkitpro/devkitPPC/bin/powerpc-eabi-gcc" \
    -DCMAKE_C_FLAGS="-L${DEVKITPRO}/portlibs/ppc/lib -I${DEVKITPRO}/portlibs/ppc/include"
  make clean || return 1
	make || return 1
}

package() {
  cd "$srcdir/Chipmunk-$pkgver"
  install -Dm0644 LICENSE.txt "${DEVKITPRO}/portlibs/ppc/share/licenses/$pkgname/LICENSE"
  make install || return 1
}

