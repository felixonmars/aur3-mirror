# Contributor : Alessandro Sagratini <ale_sagra@hotmail.com>

pkgname=nvidia-71xx-ice
pkgver=71.86.04
_kernver='2.6.25-ice'
pkgrel=2
pkgdesc="NVIDIA legacy drivers for kernel26-ice, 71xx branch"
arch=(i686 x86_64)
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('nvidia-71xx-utils' 'kernel26-ice')
conflicts=('nvidia-ice' 'nvidia-96xx-ice')
license=('custom')
source=(http://us.download.nvidia.com/XFree86/Linux-${ARCH}/${pkgver}/NVIDIA-Linux-${ARCH}-${pkgver}-pkg0.run
	NVIDIA_kernel-96.43.05-2290218.diff.txt) 
install="nvidia-71xx-ice.install"
md5sums=('56354473bddff67eefed22d79398fb93'
	'f2d9c8605a0f655b3c5c9b2434b9dccd')
[ "$CARCH" = "x86_64" ] && md5sums=('9d102e8a6a1746423f0e0a231df63eeb'
				    'f2d9c8605a0f655b3c5c9b2434b9dccd')

build() {  
  cd $startdir/src 

  # Extract
  cd $startdir/src/
  sh NVIDIA-Linux-${ARCH}-${pkgver}-pkg0.run --extract-only
  cd NVIDIA-Linux-${ARCH}-${pkgver}-pkg0
  # Any extra patches are applied in here...
  patch -Np0 -i ../NVIDIA_kernel-96.43.05-2290218.diff.txt || return 1

  cd usr/src/nv/
  ln -s Makefile.kbuild Makefile
  make SYSSRC=/lib/modules/$_kernver/build module 
  
  # install kernel module
  mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/
  install -m644 nvidia.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
