#Contributor:	Caillin Campsie	<gmail.com: ccampsie2 >
#Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>

pkgname=lib32-libdrm-git
pkgver=libdrm.2.4.43.5.gb7bb9e9
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services"
url="http://dri.freedesktop.org/"
license=('custom')
arch=('x86_64' 'i686')
groups=('lib32')
depends=('lib32-libpciaccess')
makedepends=('gcc-multilib' 'lib32-cairo')
provides=('lib32-libdrm=2.4.43')
conflicts=('lib32-libdrm')
options=(!libtool)
source=('libdrm::git://git.freedesktop.org/git/mesa/drm'
        'no-pthread-stubs.patch')
md5sums=('SKIP'
         '74010ca2d1743a9a102bb89cc983efca')

pkgver() {
  cd "${srcdir}/libdrm"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "${srcdir}/libdrm"
  patch -Np1 -i ../no-pthread-stubs.patch
}

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig" 

  cd "${srcdir}/libdrm"

  sed -i 's|PKG_CHECK_MODULES(PTHREADSTUBS, pthread-stubs)||' configure.ac

  sh autogen.sh --prefix=/usr \
      --enable-udev \
      --enable-omap-experimental-api \
      --libdir=/usr/lib32

  make
}

package() {
  cd "${srcdir}/libdrm"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/include"
}
