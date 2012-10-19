# Maintainer : Alucryd <alucryd at gmail dot com>

pkgname=nvidia-beta-source
pkgver=310.14
pkgrel=1
pkgdesc="NVIDIA kernel module source (DKMS)" 
arch=('i686' 'x86_64') 
[ "$CARCH" = x86_64 ] && ARCH=x86_64 && _srcname=NVIDIA-Linux-x86_64-${pkgver}-no-compat32
[ "$CARCH" = "i686" ] && ARCH=x86 && _srcname=NVIDIA-Linux-x86-${pkgver}
url="http://www.nvidia.com/"
license=('custom')
conflicts=('nvidia-source')
source=("http://us.download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/${_srcname}.run") 

[ "$CARCH" = "i686" ] && md5sums=('93b6fcf100a94e4e5fafc4ccd740a590')
[ "$CARCH" = "x86_64" ] && md5sums=('b84a0f1c16d81f8372c6df6ed1f8c2a9')

package() {
  cd "${srcdir}"
  if [ -d ${_srcname} ]; then
    rm -rf ${_srcname}
  fi
  sh ${_srcname}.run --extract-only
  cd ${_srcname}
  install -m755 -d kernel "${pkgdir}/usr/src"
  cp -R kernel "${pkgdir}/usr/src/nvidia-${pkgver}"
  chmod 755 -R "${pkgdir}/usr/src/nvidia-${pkgver}"
}
