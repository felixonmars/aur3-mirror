# Maintainer: Mildred Ki'Lya <mildred.fr>
pkgname=cheerp-utils-git
pkgver=20141020141618
pkgrel=1
pkgdesc="Cheerp headers and utils"
url="http://leaningtech.com/duetto/"
arch=('x86_64' 'i686')
license=(GPL2)
depends=()
optdepends=()
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
install=
source=("git://github.com/leaningtech/${pkgname%-git}")
md5sums=(SKIP)

pkgver() {
  date +%Y%m%d%H%M%S
  #cd "${pkgname%-git}"
  #git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  true
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make -C include install INSTALL_PREFIX="${pkgdir}/opt/cheerp"
  make -C tools   install INSTALL_PREFIX="${pkgdir}/opt/cheerp"
  make -C tests   install INSTALL_PREFIX="${pkgdir}/opt/cheerp"
}

# vim:set ts=2 sw=2 et:
