# created 23:48:35 - 05/04/10
# Maintainer: laloch <lalochcz@gmail.com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>
pkgname=kdeplasma-addons-applets-socketsentry
_pkgname=socketsentry
pkgver=0.9.3
pkgrel=2
pkgdesc="KDE Plasma widget that displays real-time network traffic"
url="http://code.google.com/p/socket-sentry/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('kdebase-runtime' 'libpcap')
makedepends=('cmake' 'automoc4' 'gcc' 'gmock')
install=${_pkgname}.install
source=("http://socket-sentry.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz"
	"libpthread.patch")
md5sums=('b737c58ccf79d63bf15c87d99728518a'
         'a6617ac810f2ed3ddd19061125a5df7d')

build() {
  patch -d "$srcdir/${_pkgname}-${pkgver}" -p0 < "$srcdir/libpthread.patch"

  rm -rf ${srcdir}/build
  mkdir ${srcdir}/build
  cd ${srcdir}/build
  cmake ${srcdir}/${_pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=$pkgdir install
}
