# Mantainer   : cap_sensitive
# Mantainer   : Teo Mrnjavac
# Contributor : Giuseppe Calderaro <giuseppecalderaro@gmail.com>
# Contributor : Alessandro Sagratini <ale_sagra@hotmail.com>

pkgname=nvidia-173xx-ice
pkgver=173.14.25
_kernver='2.6.33-ice'
pkgrel=1
pkgdesc="NVIDIA legacy drivers for kernel26-ice, 173xx branch"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('kernel26-ice' 'nvidia-173xx-utils')
conflicts=('nvidia-96xx-ice')
license=('custom')
install=nvidia-ice.install
source=(http://us.download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run)
md5sums=('397bac51f760505ea57e863c1db9c572')

#[ "$CARCH" = "x86_64" ] && md5sums=('148d68a518348330fd8047266552776c')

build()
{
  # Extract
  cd $startdir/src/
  sh NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run --extract-only
  cd NVIDIA-Linux-$ARCH-${pkgver}-pkg0
  
  # Any extra patches are applied in here...

  cd usr/src/nv/
  ln -s Makefile.kbuild Makefile
  make SYSSRC=/lib/modules/${_kernver}/build module || return 1
  
  # install kernel module
  mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/
  install -m644 nvidia.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
