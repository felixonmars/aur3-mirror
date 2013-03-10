#Contributor: Peter 'piie' Feuerer  <peter (a) piie.net>

pkgname=acerhdf
pkgver=0.5.30
internalpkgver=0.5.30-linux-3.6-3.8
pkgrel=1
pkgdesc="Kernelmodule to control the fan of the Acer Aspire One Netbook"
url="http://piie.net"
license="gpl"
install='acerhdf.install'
arch=('i686' 'x86_64')
conflicts=('acerfand')
makedepends=('linux-headers' 'gcc')
source=("http://www.piie.net/files/${pkgname}_kmod-${internalpkgver}.tar.gz" 'acerhdf.install')

md5sums=('9d531f4575fa4087a4dbcdf7effb595f'
	'122e47d342eb5da219b16793a60a7753')

build() {
   INST=/lib/modules/$(uname -r)/updates
   cd ${startdir}/src/${pkgname}_kmod
   make || return 1
   mkdir -p ${startdir}/pkg/${INST}
   cp acerhdf.ko ${startdir}/pkg/${INST}/
}
