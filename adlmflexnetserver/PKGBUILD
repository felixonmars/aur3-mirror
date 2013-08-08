# Maintainer: Francisco Martinez <niteiat at gmail dot com>

pkgname=adlmflexnetserver
pkgver=7.0.51
pkgrel=1
pkgdesc="Autodesk License Manager server"
url="http://www.autodesk.com"
arch=('x86_64')
license=('custom')
depends=('gcc-libs')
makedepends=('rpmextract')
source=(https://www.dropbox.com/s/htqjfuqw266l0h7/${pkgname}-${pkgver}-0.${CARCH}.rpm.bz2)
sha1sums=('2d02eb1a1e5715d2df84ae0bd0f7a006e6bc068c')
options=('!strip')

package() {
  cd ${pkgdir}
  
  rpmextract.sh ${srcdir}/${pkgname}-${pkgver}-0.${arch}.rpm 
}
