# Maintainer: Manuel Wassermann <>
pkgname=mediafire-tools
pkgver=0.60
pkgrel=1
pkgdesc="The mediafire-tools project offers two programs to interact with a mediafire account"
url="https://github.com/MediaFire/mediafire-fuse"
arch=('any')
license=('GPL2')
depends=('fuse')
source=("mediafire-tools.tar.gz")
md5sums=('f1d7525daba9491236dcb82ffe049e9c')

build() {
  cd "${srcdir}/build"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
