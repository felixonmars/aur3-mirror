# Maintainer: 404
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: MCMic <come.bernigaud@laposte.net>

pkgname=opendungeons-git
pkgver=0.4.9.r1349.072d979
pkgrel=1
pkgdesc="An open source, real time strategy game based on the Dungeon Keeper series of games (development version)"
arch=('i686' 'x86_64')
url="http://opendungeons.sourceforge.net"
license=('GPL3')
depends=('bash' 'sfml' 'ogre' 'cegui')
makedepends=('git' 'cmake' 'boost')
conflicts=("${pkgname%-*}")
source=(${pkgname%-*}::"git+https://github.com/OpenDungeons/OpenDungeons.git#branch=development"
        "${pkgname%-*}.sh")
sha256sums=('SKIP'
            '04a8b1bc5ce2752990aacd36cc129afc20705d0f4a7509ef9f848308fadc24af')

pkgver() {
  cd ${pkgname%-*}
  # there are no tags currently...
  _major=$(grep "_MAJOR_VERSION" CMakeLists.txt | grep -o "[0-9]*")
  _minor=$(grep "_MINOR_VERSION" CMakeLists.txt | grep -o "[0-9]*")
  _patch=$(grep "_PATCH_LEVEL" CMakeLists.txt | grep -o "[0-9]*")
  _rev=$(git rev-list --count HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "$_major.$_minor.$_patch.r%s.%s" "$_rev" "$_hash"
}

build() {
  cd ${pkgname%-*}

  # set C++11
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-std=c++11" ./
  make
}

package() {
  # launcher
  install -Dm755 ${pkgname%-*}.sh "$pkgdir"/usr/bin/${pkgname%-*}
  cd ${pkgname%-*}
  # binary
  install -Dm755 OpenDungeons.bin "$pkgdir"/opt/${pkgname%-*}/OpenDungeons.bin
  # media
  cp -rup gui materials models music sounds levels scripts "$pkgdir"/opt/${pkgname%-*}
  # configs
  install -m644 resources_install.cfg "$pkgdir"/opt/${pkgname%-*}/resources.cfg
  install -m644 {ogre,plugins}.cfg "$pkgdir"/opt/${pkgname%-*}
}
