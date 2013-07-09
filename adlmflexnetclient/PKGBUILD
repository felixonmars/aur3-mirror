# Maintainer: Francisco Martinez <niteiat at gmail dot com>

pkgname=adlmflexnetclient
pkgver=7.0.51
pkgrel=1
pkgdesc="Autodesk License Manager client"
url="http://www.autodesk.com"
arch=('x86_64')
license=('custom')
depends=('gcc-libs' 'bash')
makedepends=('rpmextract')
source=(https://www.dropbox.com/s/2561s9ickqd28kl/${pkgname}-${pkgver}-0.${CARCH}.rpm.bz2)
md5sums=('abfb0395df1b3dc045dc7c43e1af25d7')
sha1sums=('3ec353f82195d6409ee630f4d9d0c34d8a412cbd')
options=('!strip')

package() {
  cd ${pkgdir}
  
  rpmextract.sh ${srcdir}/${pkgname}-${pkgver}-0.${arch}.rpm 
}
