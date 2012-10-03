# Maintainer: jsteel <mail at jsteel dot org>

pkgname=somagic-capture-tools
pkgver=1.0
pkgrel=1
pkgdesc="Tool to extract the firmware for the Somagic EasyCAP DC60 and EasyCAP002 (original CD needed)"
url="http://code.google.com/p/easycap-somagic-linux"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libgcrypt')
install=$pkgname.install
source=(http://easycap-somagic-linux.googlecode.com/files/somagic-easycap-tools_$pkgver.tar.gz)
md5sums=('d42d024dd54c7fdd638e742cf187a48f')

build() {
  cd "${srcdir}/somagic-extract-firmware"

  make
}

package() {
  cd "${srcdir}/somagic-extract-firmware"

  make PREFIX="$pkgdir"/usr install
}
