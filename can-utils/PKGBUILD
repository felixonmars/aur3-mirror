# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=can-utils
_commit=0eb1e3d
pkgver="20150508.${_commit}"
pkgrel=1
pkgdesc="Linux-CAN / SocketCAN user space applications"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/linux-can/can-utils"
license=('GPLv2')
makedepends=(git libtool)
provides=can-utils
conflicts=can-utils-git
source=("git+https://github.com/linux-can/can-utils.git#commit=${_commit}")
md5sums=('SKIP')


build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir/" install
}
