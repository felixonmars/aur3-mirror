# Maintainer: Alucryd <alucryd at gmail dot com>

pkgname=nvidia-hook-beta
pkgver=310.14
pkgrel=1
pkgdesc="mkinitcpio hook to compile the NVIDIA modules"
url="http://www.nvidia.com/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('linux>=3.6' 'linux<3.7' "nvidia-utils-beta=${pkgver}" 
"nvidia-source-beta=${pkgver}" 'dkms')
conflicts=('nvidia-beta')
provides=("nvidia-beta=${pkgver}")
install=${pkgname}.install
source=("nvidia")
md5sums=('f46e845b1636aab9197134b54c9c8844')

package() {
  install -m755 -d "${pkgdir}/usr/lib/modprobe.d"
  echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
  install -m755 -d "${pkgdir}/usr/lib/initcpio/install"
  sed -i "s|version|$pkgver|g" nvidia
  sed -i "s|arch|$CARCH|g" nvidia
  install -m644 "${srcdir}/nvidia" "${pkgdir}/usr/lib/initcpio/install/nvidia"
}
