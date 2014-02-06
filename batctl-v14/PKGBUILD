# Maintainer: RubenKelevra <cyrond@gmail.com>

pkgname=batctl-v14
pkgver=2013.4.0
pkgrel=1
pkgdesc='legacy B.A.T.M.A.N. advanced control and management tool, (pinned to compatibility version 14)'
arch=('i686' 'x86_64')
url='http://www.open-mesh.net/'
license=('GPL')
source=("http://downloads.open-mesh.net/batman/releases/batman-adv-${pkgver}/batctl-${pkgver}.tar.gz")
optdepends=("batman-adv-v14: kernel modul")
conflicts=(
  "batman-adv>2013.4.0"
  "batctl"
)
provides=("batctl=2013.4.0")
build(){
  cd "${srcdir}/batctl-${pkgver}"
  make
}
package() {
  cd "${srcdir}/batctl-${pkgver}"
  make DESTDIR="${pkgdir}"  PREFIX=/usr SBINDIR=/usr/bin install
}
sha256sums=('4deae3b6664d0d13acf7a8ece74175a31a72fe58fb15cb9112a9a2014b32cb4c')
