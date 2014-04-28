# Maintainer: Roel Blaauwgeers <roel at ttys0.nl>
# Contributer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ettercap-gtk-git
pkgver=v0.8.0.r622.g9a51ea3
pkgrel=2
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
  cd "${srcdir}"/${pkgname}
  mkdir build
  cd build
  cmake -D ENABLE_GTK=ON -D CMAKE_INSTALL_PREFIX=/usr -D INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release ../
  make
}

package() {
  pkgdesc="A network sniffer/interceptor/logger for ethernet LANs - GTK frontend"
  depends=('gtk2')
  backup=('etc/ettercap/etter.conf')
  conflicts=('ettercap ettercap-git')
  provides=('ettercap-git')
  optdepends=('polkit: to run ettercap directly from menu')

  cd "${srcdir}"/"${pkgname}"/build
  make DESTDIR="${pkgdir}" install
}
