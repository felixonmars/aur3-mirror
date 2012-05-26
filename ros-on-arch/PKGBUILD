# Maintainer: hauptmech <hauptmech@gmail.com>
# Contributor: erwinkendo
pkgname=ros-on-arch
pkgver=1
pkgrel=2
pkgdesc="Provides some files necessary for building ROS packages on archlinux"
url="http://www.ros.org"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
optdepends=('ros-core')
makedepends=()
conflicts=()
replaces=()
backup=()
install='ros-on-arch.install'
source=("tinyxml.pc" "tbb.pc" "ros-on-arch.install")

build() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}"
  dest=$pkgdir/usr/lib/pkgconfig
  mkdir -p $dest 
  install tinyxml.pc $dest
  install tbb.pc $dest

}

md5sums=('d3189eb73529135b093d41a0e9c86c9a'
         'bfba8b83ecbe059303add90e5f4f220a'
         '93c9a46c2736073f23ce62bfb1487b00')

