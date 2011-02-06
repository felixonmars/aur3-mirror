# Contributor : Giuseppe Calderaro <giuseppecalderaro@gmail.com>
# Contributor : Alessandro Sagratini <ale_sagra@hotmail.com>
# Contributor  : Xabre <Xabre_666 at operamail dot com>

pkgname=nvidia-96xx-ice
pkgver=96.43.14
_kernver='2.6.32-ice'
pkgrel=2
pkgdesc="NVIDIA legacy drivers for kernel26-ice, 96xx branch"
arch=(i686 x86_64)
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('kernel26-ice>=2.6.32' 'kernel26-ice<2.6.33' 'nvidia-96xx-utils')
conflicts=('nvidia-ice' 'nvidia-173xx-ice')
install=nvidia-96xx-ice.install
license=('custom')
source=("http://download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run")
sha256sums=('7906f34371f06ca8deb977e1e9c321b1687e0db3fecf98e1ba7bc0779b8c236d')
[ "$CARCH" = "x86_64" ] && sha256sums=('19fa6878061bf413dac4de4b17a5e32f26cf699f7b958805e4b9f0b03892af54')

build()
{
  # Extract
  cd $startdir/src/
  sh NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run --extract-only
  cd NVIDIA-Linux-$ARCH-${pkgver}-pkg0
  
  # Any extra patches are applied in here...
  cd usr/src/nv/
  ln -s Makefile.kbuild Makefile
  make SYSSRC=/lib/modules/$_kernver/build module 
  
  # install kernel module
  mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/
  install -m644 nvidia.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/nvidia.install
}
