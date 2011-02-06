#Contributor: Peter 'piie' Feuerer  <peter (a) piie.net>

pkgname=acerhdf
pkgver=0.5.25
pkgrel=1
pkgdesc="Kernelmodule to control the fan of the Acer Aspire One Netbook"
url="http://piie.net"
license="gpl"
install=('acerhdf.install')
arch=('i686' 'x86_64')
conflicts=('acerfand')
makedepends=('kernel26-headers' 'gcc')
source=("http://www.piie.net/files/${pkgname}_kmod-${pkgver}.tar.gz" 'acerhdf.install')

md5sums=('676be2c5e8ade0fa12973c5d97bb13fc'
	 '6a2084197ab33d70416d0fd1c9600146')

    
build() {
   INST=/lib/modules/$(uname -r)/updates
   cd ${startdir}/src/${pkgname}_kmod
   make || return 1
   mkdir -p ${startdir}/pkg/${INST}
   cp acerhdf.ko ${startdir}/pkg/${INST}/
}
