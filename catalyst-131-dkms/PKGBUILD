# Maintainer: yadieet <yadieet@gmail.com>
# Contributor: Vi0L0, wonder, Eduardo "kensai" Romero
# Contributor: aidanlinz, Rip-Rip, OvsInc, Sebastian Siebert

pkgname=catalyst-131-dkms
pkgver=13.1
pkgrel=1
_amdver=9.012
pkgdesc="AMD proprietary gpu kernel driver. AMD Radeon HD 2k,3k,4k not supported."
arch=('i686' 'x86_64')
url="http://support.amd.com/us/kbarticles/Pages/AMDCatalyst131ProprietaryLinuxGraphicsDriverReleaseNotes.aspx"
license=('custom')
depends=('dkms' 'linux>=3.10' 'xorg-server>=1.7.0' 'xorg-server<1.14')
optdepends=('linux-headers: build the module against Arch kernel'
            'linux-lts-headers: build the module against LTS Arch kernel')
replaces=('catalyst-lts-dkms') # useless
conflicts=('catalyst-dkms')
provides=('catalyst-dkms')

source=(http://www2.ati.com/drivers/linux/amd-driver-installer-catalyst-13.1-linux-x86.x86_64.zip
        dkms.conf
        kernel-3.7-fixes.patch
	    kernel-3.8-fixes.patch
        )

md5sums=('e72b6fcd950d4caa2348af06e7dc9365'
         '972049dc247a74a7162f2227078abcb0'
         '02d6442c31dd8413bc1d316308d1fa56'
         '52a79bddac813f19f72fcb32acebb1b9'
         )

install=catalyst.install

package() {
  depends=(${depends[@]} "catalyst-131-utils=${pkgver}")

  cd ${srcdir}
  
  if [ "${CARCH}" = "x86_64" ]; then
    _archdir=x86_64
  else
    _archdir=x86
  fi

  sh ./amd-driver-installer*.run --extract fglrx-install

  cd fglrx-install
  patch -Np1 -i ../kernel-3.7-fixes.patch
  patch -Np1 -i ../kernel-3.8-fixes.patch

  install -dm755 "${pkgdir}/usr/lib/modprobe.d"
  install -dm755 "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}"
  cp -r common/lib/modules/fglrx/build_mod/* "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/"
  cp "arch/${_archdir}"/lib/modules/fglrx/build_mod/libfglrx_ip.a "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/"
  cp ${srcdir}/dkms.conf "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/"
  
  cp ${srcdir}/drm_proc.h "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/"
  cp ${srcdir}/firegl_public.c "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/"
  cp ${srcdir}/firegl_public.h "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/"
   
  sed -i -e "s/@VERSION@/${pkgver}-${pkgrel}/" "${pkgdir}/usr/src/fglrx-${pkgver}-${pkgrel}/dkms.conf"
  echo "blacklist radeon" >> "${pkgdir}/usr/lib/modprobe.d/catalyst.conf"
  
  # license
  install -Dm644 "common/usr/share/doc/fglrx/LICENSE.TXT" "${pkgdir}/usr/share/licenses/catalyst-dkms/LICENSE.TXT"
}
