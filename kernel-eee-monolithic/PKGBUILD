pkgname=kernel-eee-monolithic
pkgver=3.0
_kernver=3.0
pkgrel=8
pkgdesc="The Linux Kernel for the Asus Eee PC 901 without module support"
arch=('i686')
license=('GPL2')
url="http://www.kernel.org"
#makedepends=('gcc<4.6')
replaces=('linux-uvc-eee-svn' 'madwifi-eee-svn' 'kernel26-eee-monolithic')
optdeps=("rt2860-firmware: wlan (if it's not already working)")
install=kernel-eee-monolithic.install
source=(http://www.kernel.org/pub/linux/kernel/v3.0/linux-${_kernver}.tar.bz2
        kernelconfig
       )

build() {
	
  # unset since our build machine may differ from eee
  unset CFLAGS CXXFLAGS

  # get into the linux source directory and start some magic
  cd ${srcdir}/linux-${_kernver}
  
  # load configuration and build kernel
  cp ../kernelconfig ./.config
  make oldconfig || return 1
  #make menuconfig
  make || return 1
 
}

package() {

  # install the kernel
  mkdir ${pkgdir}/lib
  mkdir ${pkgdir}/boot
  cd ${srcdir}/linux-${_kernver}
  cp System.map ${pkgdir}/boot/System.map30-eee
  cp arch/x86/boot/bzImage ${pkgdir}/boot/vmlinuz30-eee
}
sha256sums=('64b0228b54ce39b0b2df086109a7b737cde58e3df4f779506ddcaccee90356a0'
            '43f94c4895cf01936335a31a0e7b48d4501b6a13c852d21f40297b2ee893adc9')
