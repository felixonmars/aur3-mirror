# Contributor : Teo Mrnjavac <teo.mrnjavac@gmail.com>
# Contributor : Giuseppe Calderaro <giuseppecalderaro@gmail.com>
# Contributor : Alessandro Sagratini <ale_sagra@hotmail.com>

pkgname=nvidia-ice-beta
pkgver=180.18
_kernver='2.6.28-ice'
pkgrel=2
pkgdesc="Unstable NVIDIA drivers for kernel26-ice."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('kernel26-ice' 'nvidia-utils-beta')
conflicts=('nvidia-96xx-ice' 'nvidia-ice')
license=('custom')
install=nvidia-ice.install
source=(ftp://download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run)
md5sums=('47975dac9787cdbfbca392824c85c31e')
[ "$CARCH" = "x86_64" ] && md5sums=('a02b0669dbee6731bbc5954636c2e308')

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
