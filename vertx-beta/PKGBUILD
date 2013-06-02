# Maintainer: John Warner <warnerj71 at gmail dot com>

pkgname="vertx-beta"
pkgver=2.0.0_beta2
#The actual packager version as it appears in the file name
_realver=2.0.0-beta2
pkgrel=2
pkgdesc="Effortless asynchronous application development for the modern web and\
 enterprise"
arch=("i686" "x86_64")
url="http://vertx.io"
license=("APACHE")
depends=("java-environment>=7")
source=("http://vert-x.github.io/vertx-downloads/downloads/vert.x-${_realver}.tar.gz")
install=vertx-beta.install

build() {
  msg "nothing to build"
}

package() {
  install -dm755 ${pkgdir}/opt

  mv ${srcdir}/vert.x-${_realver}/ ${pkgdir}/opt/vertx-beta
  chmod -R +rwX ${pkgdir}/opt/vertx-beta
}

md5sums=('a9fdb43db890c92012937a8ca7b0b279')
