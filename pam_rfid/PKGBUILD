# Maintainer: 
pkgname=pam_rfid
pkgver=2.0
pkgrel=1
pkgdesc="PAM RFID authentication module"
arch=('x86_64')
url="https://github.com/Artiom-M/pam_rfid/blob/master/README.md"
license=('GPL')
depends=('openssl' 'pcsclite')
makedepends=('git')
source=('git://github.com/Artiom-M/pam_rfid.git#tag=v'$pkgver)
md5sums=('SKIP')

build() {
  pushd ""${srcdir}"/${pkgname}"
  	make
  popd
}

package() {
  pushd "${srcdir}"/${pkgname}
	make install DESTDIR=${pkgdir}
  popd
}
