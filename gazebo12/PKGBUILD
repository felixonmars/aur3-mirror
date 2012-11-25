# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>
# Contributor: Stefan Lohmaier <stefan.lohmaier@gmail.com>

pkgname=gazebo12
pkgver=1.2.6
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
md5sums=('aba09465d0b3367cf27df37bbda2ccc5'
         '756d9387da32a483e41734dbe7b05a38')

build() {
  cd "${srcdir}/gazebo-${pkgver}"

  patch -Np1 < ../boost15.patch

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  sed -i "s/BOOST_FILESYSTEM_VERSION 2/BOOST_FILESYSTEM_VERSION 3/g" gazebo/common/Material.cc
  make
}

package() {
  cd "${srcdir}/gazebo-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
