# Maintainer: onefire <onefire.myself@gmail.com>
pkgname=nvidia-custom
pkgver=337.12
pkgrel=1
pkgdesc="NVIDIA drivers for linux. Customized to be compatible with libgl. Use this coupled with my other "custom" packages to have CUDA without bumblebee on laptops."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=("linux>=3.12" "linux<3.13" "nvidia-utils-custom=${pkgver}")
makedepends=("linux-headers>=3.12" "linux-headers<3.13")
conflicts=('nvidia' 'nvidia-bumblebee')
provides=('nvidia')
license=('custom')
install=nvidia-custom.install
options=(!strip)
groups=('nvidia-cuda' 'custom')
_kernver=`uname -r`
_extramodules="extramodules-3.12-ARCH"

if [ "$CARCH" = "i686" ]; then
	_arch='x86'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}"
	sha512sums=("2ec35db2d66828093bbdd4458ebe441a6ef00cbc04b8c65f8e3a9be8830b7118d34654dff18f87c14bb941e2b43091a680f8d9f1681aed2b8bb0189531d016be")

elif [ "$CARCH" = "x86_64" ]; then
	_arch='x86_64'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
	sha512sums=("368719ae7f37cfb4743313fe9e199d29dae7bd9c8cba0260fea237927fe3cacf8af158f19b51058daf8dcf2fe3796b6f40e96585f06e30f9c91c48bc09019219")
fi

source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")

build() {
  cd "${srcdir}"
  sh "${_pkg}.run" --extract-only
  cd "${_pkg}/kernel"
  make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
  install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
  install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
  echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
  sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia-custom.install"
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
}
