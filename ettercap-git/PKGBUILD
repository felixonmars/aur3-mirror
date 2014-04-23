# Maintainer: Roel Blaauwgeers <roel at ttys0.nl>
# Contributer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ettercap-git
pkgver=v0.8.0.r622.g9a51ea3
pkgrel=1
arch=('i686' 'x86_64')
url="http://ettercap.github.com/ettercap/"
license=('GPL')
depends=('openssl' 'libpcap' 'pcre' 'libltdl' 'libnet' 'ethtool' 'curl')
makedepends=('ghostscript' 'cmake' 'libpcap' 'libltdl' 'libnet' 'gtk2')
options=('!makeflags' '!emptydirs')
source=("${pkgname}::git://github.com/Ettercap/ettercap.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir build
  cd build
  cmake -D ENABLE_GTK=OFF -D CMAKE_INSTALL_PREFIX=/usr -D INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release ../
  make
}

package() {
  pkgdesc="A network sniffer/interceptor/logger for ethernet LANs - console"
  backup=('etc/ettercap/etter.conf')
  conflicts=('ettercap-gtk ettercap-gtk-git')

  cd "${srcdir}"/${pkgname}/build
  make DESTDIR="${pkgdir}" install
}
