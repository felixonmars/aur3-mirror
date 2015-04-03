# Maintainer: Semyon Bochkaryov <squizduos@gmail.com>
pkgname=grive-daemon
pkgver=8cb351
pkgrel=2
pkgdesc="Daemon for grive utility"
url="https://github.com/WarriorIng64/grive-daemon/commits/master"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('grive' 'make' 'notify-osd')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("git://github.com/WarriorIng64/grive-daemon.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
 }
