#Contributor: Peter 'piie' Feuerer  <peter (a) piie.net>

pkgname=acerhdf
pkgver=0.5.28b
pkgrel=1
pkgdesc="Kernelmodule to control the fan of the Acer Aspire One Netbook"
url="http://piie.net"
license="gpl"
install='acerhdf.install'
arch=('i686' 'x86_64')
conflicts=('acerfand')
makedepends=('linux-headers' 'gcc')
source=("http://www.piie.net/files/${pkgname}_kmod-${pkgver}.tar.gz" 'acerhdf.install')

md5sums=('9f5c4d7f97b7ce03c3d60da4ed69e66a'
	'6a2084197ab33d70416d0fd1c9600146')
    
build() {
   INST=/lib/modules/$(uname -r)/updates
   cd ${startdir}/src/${pkgname}_kmod
   make || return 1
   mkdir -p ${startdir}/pkg/${INST}
   cp acerhdf.ko ${startdir}/pkg/${INST}/
}
