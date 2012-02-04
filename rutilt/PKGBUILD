# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jesus Lazaro Plaza <jesuslazaro84@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=rutilt
pkgver=0.18
pkgrel=2
pkgdesc="GTK2 utility that helps you configure your wireless network devices"
arch=('i686' 'x86_64')
url="http://bonrom.cbbknet.com"
license=('GPL2')
depends=('gtk2' 'xdg-utils')
makedepends=('wireless_tools' 'kernel26-headers')
install=${pkgname}.install
source=("http://bonrom.cbbknet.com/files/RutilTv${pkgver}.tar.gz")
md5sums=('c745af9fbadd3a843b6f8273b6eb71bd')

build() {
  cd "${srcdir}"/RutilTv${pkgver}
  
  ./configure.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/RutilTv${pkgver}
  make DESTDIR="${pkgdir}" install
}
