# Maintainer: Paul Adams <paul -at- thoughtcriminal -dot- co.uk>
pkgname=wiringhb-git
pkgver=r7.f66bcca
pkgrel=1
pkgdesc="wiringHB is a wiringPi port for the Hummingboard."
arch=('armv7h')
url="https://github.com/pilight/wiringHB"
license=('GPL')
groups=()
depends=('glibc')
makedepends=('git' 'cmake' 'sed')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(${pkgname}::git+https://github.com/pilight/wiringHB)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  msg2 "Removing insecure rpaths"
  sed -i 's|,-rpath=/usr/local/lib/||g' CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:

