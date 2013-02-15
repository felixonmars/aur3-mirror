# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: seschwar <seschwar@gmail.com>
pkgname="xorg-launch-helper"
pkgver=v4
pkgrel=4
pkgdesc="an xorg launcher for systemd user sessions"
url="https://github.com/sofar/xorg-launch-helper"
license=('GPL2')
arch=(i686 x86_64)
source=("https://github.com/sofar/$pkgname/tarball/$pkgver")
depends=('systemd' 'xorg-server')

build() {
  cd "${srcdir}/sofar-$pkgname-"*

  ./autogen.sh
  
  ./configure --prefix=/usr

   make
}

package() {
  cd "${srcdir}/sofar-$pkgname-"*

  make DESTDIR="${pkgdir}" install
}
md5sums=('b6d05a61ecada212d721790c7cbbaa84')
