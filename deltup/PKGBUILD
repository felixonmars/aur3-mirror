# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=deltup
pkgver=0.4.5
pkgrel=2
pkgdesc="a source package update system that performs similarly to diff/patch for packages"
arch=('i686' 'x86_64')
url="http://www.deltup.org"
license=('GPL2')
depends=('bzip2' 'openssl')
source=(http://deltup.org/e107_files/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=('3f81c10218ff166eaa3b95f682c9aa8c') 

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make 
  make prefix=/usr DESTDIR=${pkgdir}/ install
}
