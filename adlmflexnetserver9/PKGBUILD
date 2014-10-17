# Maintainer: Francisco Martinez <niteiat at gmail dot com>

pkgname=adlmflexnetserver9
pkgver=9.0.23
pkgrel=1
pkgdesc="Autodesk License Manager server"
url="http://www.autodesk.com"
arch=('x86_64')
license=('custom')
depends=('gcc-libs' 'ld-lsb')
makedepends=('rpmextract')
source=(https://www.dropbox.com/s/jvhlk46mnnwu7hj/${pkgname/9/}-${pkgver}-0.${arch}.tar.bz2)
md5sums=('31bed0952e3d31a69454ed92bac556d4')
options=('!strip')

package() {
  cd ${pkgdir}
  
  rpmextract.sh ${srcdir}/${pkgname/9/}-${pkgver}-0.${arch}.rpm 
}