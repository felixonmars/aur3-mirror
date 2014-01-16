# Maintainer: Ahmad24 <myitrayan at gmail dot com>
# Contributor: alucryd <alucryd at gmail dot com>
# Contributor: jarda-wien <xstej70 at gmail dot com>
# Contributor: Jason Melton <jason dot melton at gmail dot com>
# Contributor: Atilla ÖNTAŞ <tarakbumba at gmail dot com>

pkgname=nvidia-dkms-grsec
pkgver=331.38
pkgrel=1
pkgdesc="NVIDIA kernel module sources (DKMS) For linux-grsec,Also work in Linux vanilla Kernel"
arch=('i686' 'x86_64')
[[ $CARCH == i686 ]] && _arch=x86 && _pkg=NVIDIA-Linux-${_arch}-${pkgver} && md5sums=('16aa229f7f118c8cafad6fb3f4ac082e')
[[ $CARCH == x86_64 ]] && _arch=x86_64 && _pkg=NVIDIA-Linux-${_arch}-${pkgver}-no-compat32 && md5sums=('f2059ae373665cb6c8fb826e1173b04d')
url="http://www.nvidia.com/"
license=('custom')
depends=('linux-grsec>=3.7'  'linux-grsec<3.13' 'dkms' "nvidia-utils>=${pkgver}" "nvidia-libgl>=${pkgver}")
provides=("nvidia=${pkgver}")
conflicts=('nvidia')
install="${pkgname}.install"
source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run"
        'nvidia-dkms-grsec.patch')
md5sums+=('269b9125cfbd51667cd732c9288c55b8')

prepare() {  
#  [ "x$(uname -r 2>/dev/null | grep -io 'grsec')" == "x" ] && {
#    msg "Current Kernel : $(uname -r)"
#    msg "You must boot into linux-grsec kernel.Stopping build"
#    return 1
#  }
  
  if [[ -d ${_pkg} ]] ; then
    rm -rf ${_pkg}
  fi

  sh ${_pkg}.run --extract-only

  cd ${_pkg}
  patch -Np1 -i ../nvidia-dkms-grsec.patch
}

package() {  
  cd ${_pkg}

  mkdir -p "${pkgdir}"/usr/src
  cp -dr --no-preserve=ownership kernel "${pkgdir}"/usr/src/nvidia-${pkgver}

# Blacklist nouveau driver
  mkdir -p "${pkgdir}"/usr/lib/modprobe.d
  echo "blacklist nouveau" > "${pkgdir}"/usr/lib/modprobe.d/nvidia.conf

# Fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}"/usr/src/nvidia-${pkgver}/conftest.sh

# License
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s nvidia "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:
