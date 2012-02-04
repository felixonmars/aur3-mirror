# Contributor: Jesus LAzaro Plaza <jesuslazaro84@gmail.com>

pkgname=fsam7440
pkgver=0.4
pkgrel=1
_kernver=$(uname -r)
pkgdesc="A module for Linux Kernel 2.4/2.6 that allows change the status of wireless card's radio on Fujitsu-Siemens Amilo M 7440."
arch=('i686' 'x86_64')
url="http://fsam7440.sourceforge.net/"
license=('GPL')
source=(http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
depends=('kernel26')
install=fsam7440.install

md5sums=('d7567212acb5aca03b7926bbfcf67721')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}

  	make KDIR=/lib/modules/${_kernver}/build || return 1
  	
	make DEST=${startdir}/pkg/lib/modules/${_kernver}/kernel/net/wireless/ install
} 
