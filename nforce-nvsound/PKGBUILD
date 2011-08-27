# contributor: Carlos Salvador<safeharmonics at g mail dot com>
# Contributor: Tom Billiet

pkgname=nforce-nvsound
pkgver=1.0.0310
_nver=1.0-0310
_kernver='2.6.28-ARCH'
pkgrel=13
pkgdesc="Nvidia binary-only oss drivers for nforce 2 with soundstorm"
arch=(i686)
url="http://www.nvidia.com"
depends=('kernel26' 'nforce-nvsound-utils')
conflicts=('nforce')
license=("custom:NVIDIA")
source=(ftp://download.nvidia.com/XFree86/nforce/${_nver}/NFORCE-Linux-x86-${_nver}-pkg1.run 
	nforce-nvsound.patch)
md5sums=('9e0b636ff53f4f23768383af962cc68c' 'b903ca16d1cd5c73798e2dc696e4173d')
install=("nforce.install")

build() {  
  	cd $startdir/src/
	sh NFORCE-Linux-x86-${_nver}-pkg1.run --extract-only
	cd NFORCE-Linux-x86-${_nver}-pkg1
  
	# Any extra patches are applied in here..
	
	patch -p1 < ../nforce-nvsound.patch || return 1 

	# build nvsound
	cd $startdir/src/NFORCE-Linux-x86-${_nver}-pkg1/nvsound/main/

	#ln -s Makefile.kbuild Makefile
	make SYSSRC=/lib/modules/$_kernver/build module || return 1
  
	#install nvsound kernel module
	mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/sound/pci/
	install -m644 nvsound.ko $startdir/pkg/lib/modules/${_kernver}/kernel/sound/pci/
 
	sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
