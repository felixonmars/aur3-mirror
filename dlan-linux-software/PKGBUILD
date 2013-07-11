# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

arch=('i686' 'x86_64')
pkgname=dlan-linux-software
pkgver=6.1
pkgrel=1
pkgdesc="Devolo dLAN configuration tool"
url="http://www.devolo.com/consumer/downloads.html"
license=('custom')
depends=('gcc-libs')
install=${pkgname}.install
source=(http://www.devolo.com/downloads/software/software-dlan-linux-v${pkgver/./-}.tar.gz)
md5sums=('5e4ee729b1de85fc2b6b4e8bc773fd89')
replaces=('dlan-linux-package')

build() {
  cd ${srcdir}/dlan-linux-software
  make
}

package() {
  cd ${srcdir}/dlan-linux-software
  mkdir -p ${pkgdir}/usr/bin
  make PREFIX=${pkgdir}/usr install
  
  # license
  install -m 644 -D README ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
