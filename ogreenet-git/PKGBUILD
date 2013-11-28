# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/ogreenet-git

pkgname=ogreenet-git
pkgver=0.r23.ec30604
pkgrel=1
pkgdesc="OgreENet is an ENet wrapper for the Ogre3D graphics engine."
arch=('i686' 'x86_64')
url="https://github.com/bwrsandman/ogreenet"
license=('GPL3' 'custom')

depends=('ogre' 'enet')
makedepends=('git' 'cmake' 'boost')
conflicts=('ogreenet')
provides=('ogreenet')

source=('git://github.com/bwrsandman/ogreenet')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
