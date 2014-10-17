# Maintainer: Francisco Martinez <niteiat at gmail dot com>

pkgname=adlmflexnetclient9
pkgver=9.0.23
pkgrel=1
pkgdesc="Autodesk License Manager client"
url="http://www.autodesk.com"
arch=('x86_64')
license=('custom')
depends=('gcc-libs' 'bash')
makedepends=('rpmextract')
source=(https://www.dropbox.com/s/y2a0nmh8lzch43j/${pkgname/9/}-${pkgver}-0.${arch}.tar.bz2)
md5sums=('83bb52eb9dfec4e691ef82e2bb109188')
options=('!strip')

package() {
  cd ${pkgdir}
  
  rpmextract.sh ${srcdir}/${pkgname/9/}-${pkgver}-0.${arch}.rpm 
}
