# Contributor: Rainy <rainylau(at)gmail(dot)com>
pkgname=fake
pkgver=1.1.11
pkgrel=1
pkgdesc="Switches in redundant servers using arp spoofing."
license=('GPL')
arch=('i686' 'x86_64')
url="http://vergenet.net/linux/fake/"
depends=('glibc')
source=(http://www.vergenet.net/linux/${pkgname}/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('354c2041251fea199473f6a767045baa')

build() {
   cd ${srcdir}/${pkgname}-${pkgver}
   make patch || return 1
   make || return 1
   make ROOT_DIR=${pkgdir} install
}
