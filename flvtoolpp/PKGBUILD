# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

pkgname=flvtoolpp
pkgver=1.2.1
pkgrel=3
pkgdesc="Tool for hinting and manipulating the metadata of FLV files."
arch=('i686' 'x86_64')
url="http://mirror.facebook.net/facebook/flvtool++/"
license=('BSD')
depends=('boost')
makedepends=('scons')
source=(http://files.mediaspip.net/binaires/flvtool++-${pkgver}.tar.gz)
md5sums=('a8c4c578b4c6741a94ca6eb197a01fe1')

build() {
  cd "${srcdir}"

  scons
}

package() {
  cd "${srcdir}"

  mkdir -p	"${pkgdir}/usr/bin"
  cp flvtool++ "${pkgdir}/usr/bin/"
}
