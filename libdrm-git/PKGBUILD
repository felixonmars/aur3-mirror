# Maintainer: Samuel Pitoiset <samuel.pitoiset at gmail.com>
# Arch libdrm Contributors:
#       Chirantan Ekbote
#	Jan de Groot
#	Andreas Radke

pkgname=libdrm-git
pkgver=2.4.58.4.g00847fa
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services"
url="http://dri.freedesktop.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc' 'libpciaccess')
provides=('libdrm=$pkgver')
conflicts=('libdrm')
makedepends=('git' 'udev')
options=('!libtool')
changelog=CHANGELOG
source=('git://git.freedesktop.org/git/mesa/drm')
md5sums=('SKIP')

pkgver() {
  cd 'drm'
  git describe --always | sed 's|libdrm.||g;s|-|.|g'
}

build() {
  cd drm
  sed -i 's/PKG_CHECK_MODULES(PTHREADSTUBS, pthread-stubs)//' configure.ac

  ./autogen.sh
  ./configure --prefix=/usr \
		--enable-udev \
		--enable-intel \
		--enable-radeon \
		--enable-nouveau \
		--enable-vmwgfx
  make V=1
}

check() {
  cd drm
  make -k check
}

package() {
  cd drm
  make DESTDIR="$pkgdir" install
}
