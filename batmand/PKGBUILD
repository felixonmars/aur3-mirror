# Contributor: Nathan O <ndowens.aur at gmail dot com> 
pkgname="batmand"
pkgver=0.3.2
pkgrel=2
pkgdesc="Better Approach To Mobile Ad-hoc Networking: a routing protocol for multi-hop ad-hoc mesh networks."
arch=('i686' 'x86_64')
url="http://www.open-mesh.org"
license=('GPL')
depends=('glibc')
source=(http://downloads.open-mesh.net/batman/releases/batman-${pkgver}/batman-${pkgver}.tar.gz)
md5sums=('3f2f6b408828d34c5c2f1445e744e6ac')

build() {
  cd "$srcdir/batman-${pkgver}"	  
  make
  }
install() {
  cd "$srcdir/batman-${pkgver}" {
  install -d ${pkgdir}/usr/sbin/
  install -D batmand ${pkgdir}/usr/sbin/ 
}

