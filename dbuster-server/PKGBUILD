# Maintainer: Dominique Lasserre <lasserre.d@gmail.com>
pkgname=dbuster-server
pkgver=0.4.1
pkgrel=1
pkgdesc='Manage supported applications to preload into memory and launch them if needed over D-Bus.'
arch=('i686' 'x86_64')
url='https://launchpad.net/dbuster'
license=('GPL3')
depends=('dbuster>=0.5.4')
makedepends=('vala')
conflicts=('dbuster-server-bzr')
source=("https://launchpad.net/dbuster/server-trunk/server-${pkgver}/+download/dbuster-server_${pkgver}.tar.gz")
md5sums=('af5dac02f668eedc8afc3fd1b0affab4')

build(){
  cd "${srcdir}/dbuster-server"
  make
}

package(){
  cd "${srcdir}/dbuster-server"
  make DESTDIR="${pkgdir}" install
}
