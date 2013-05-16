# Maintainer: Tom Gundersen <teg@jklm.no>
pkgname="user-session-units"
pkgver=v8
pkgrel=2
pkgdesc="units for launching systemd user sessions"
url="https://github.com/sofar/user-session-units"
license=('GPL2')
arch=(any)
depends=('xorg-launch-helper')
source=("git://github.com/sofar/${pkgname}.git#tag=${pkgver}")

build() {
  cd "${pkgname}"

  ./autogen.sh
  
  ./configure --prefix=/usr

   make
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install
}
md5sums=('SKIP')
