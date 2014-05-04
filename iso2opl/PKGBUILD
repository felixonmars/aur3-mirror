# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=iso2opl
pkgver=0.1.2
_oplver=0.9.2
pkgrel=3
pkgdesc="ISO installer for Open USB Loader command-line."
arch=('i686' 'x86_64')
url="http://www.psx-scene.com/forums/showthread.php?t=62141"
license=('GPL')
source=(http://bitbucket.org/ifcaro/open-ps2-loader/get/${_oplver}.tar.gz)
sha256sums=('e3f11e06d31237cf312bbec39fdfbeebe6bf1fe20f7a66c67e0c67a735927f52')

build() {
  cd ${srcdir}/ifcaro-open-ps2-loader-*/pc

  make
}

package() {
  cd ${srcdir}/ifcaro-open-ps2-loader-*/pc
  
  mkdir -p ${pkgdir}/usr/bin
  install -m 755 ${srcdir}/ifcaro-open-ps2-loader-*/pc/iso2opl/bin/iso2opl ${pkgdir}/usr/bin/
}
 
