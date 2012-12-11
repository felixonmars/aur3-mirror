# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>
# Contributor: Stefan Lohmaier <stefan.lohmaier@gmail.com>

pkgname=gazebo13
pkgver=1.3.0
pkgrel=1
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
depends=('boost' 'cegui' 'intel-tbb' 'libltdl' 'libxml2' 'ogre' 'protobuf' 'qt' 'tinyxml' 'libtar')
provides=('gazebo')
conflicts=('gazebo')
makedepends=('cmake')
install="gazebo.install"
source=("http://gazebosim.org/assets/distributions/gazebo-${pkgver}.tar.bz2" "boost15.patch")
md5sums=('cf1b0bab3d824c072194987cce123cc5'
         '558462831a841c5c11dabdd722d9fa15')

build() {
  cd "${srcdir}/gazebo-${pkgver}"

  patch -Np1 < ../boost15.patch

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/gazebo-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
