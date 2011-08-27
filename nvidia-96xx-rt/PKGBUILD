# Contributor: Jon Kristian Nilsen <jokr.nilsen@gmail.com>
# Contributor: Missed <Jerry87905@gmail.com>
# Contributor: Acker <acker@indisgrace.de>
# Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>

pkgname=nvidia-96xx-rt
pkgver=96.43.05
_kernver='2.6.24-rt'
pkgrel=1
pkgdesc="NVIDIA legacy drivers for kernel26rt, 96xx branch"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64

url="http://www.nvidia.com/"
depends=('kernel26rt>=2.6.24.2_rt2-2' 'nvidia-96xx-utils')
conflicts=('nvidia-rt')
license=('custom')
install=nvidia.install

source=(http://us.download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run)
md5sums=('575750b17f9fd19490fd999a72c7a661')
[ "$CARCH" = "x86_64" ] && md5sums=('da37aa996073c4e813eda1be150a44d8')

build()
{
  # Extract
  cd $startdir/src/
  sh NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run --extract-only
  cd NVIDIA-Linux-$ARCH-${pkgver}-pkg0
  
  # Any extra patches are applied in here...

  cd usr/src/nv/
  ln -s Makefile.kbuild Makefile
  make SYSSRC=/lib/modules/${_kernver}/build module 
  
  # install kernel module
  mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/
  install -m644 nvidia.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/video/

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}