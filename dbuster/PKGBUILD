# Maintainer: Dominique Lasserre <lasserre.d@gmail.com>
pkgname=dbuster
pkgver=0.5.4
pkgrel=1
pkgdesc='D-Bus booster library. Preload programs and start them over D-Bus.'
arch=('i686' 'x86_64')
url='https://launchpad.net/dbuster'
license=('GPL3')
depends=('libgee')
makedepends=('vala')
conflicts=('dbuster-bzr')
source=("https://launchpad.net/dbuster/trunk/${pkgver}/+download/dbuster_${pkgver}.tar.gz")
md5sums=('1121b4eb350ce693cf8eaa535b0c12ea')

build(){
  cd "${srcdir}/libdbuster"
  make
}

package(){
  cd "${srcdir}/libdbuster"
  make DESTDIR="${pkgdir}" install
}
