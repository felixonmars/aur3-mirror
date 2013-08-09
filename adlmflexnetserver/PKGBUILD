# Maintainer: Francisco Martinez <niteiat at gmail dot com>

pkgname=adlmflexnetserver
pkgver=7.0.51
pkgrel=1
pkgdesc="Autodesk License Manager server"
url="http://www.autodesk.com"
arch=('x86_64')
license=('custom')
depends=('gcc-libs' 'ld-lsb')
makedepends=('rpmextract')
source=(https://www.dropbox.com/s/htqjfuqw266l0h7/${pkgname}-${pkgver}-0.${CARCH}.rpm.bz2)
md5sums=('6780798c7c1b0569af8a348dd0e3a711')
options=('!strip')

package() {
  cd ${pkgdir}
  
  rpmextract.sh ${srcdir}/${pkgname}-${pkgver}-0.${arch}.rpm 
}
