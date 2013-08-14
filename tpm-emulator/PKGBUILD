# Maintainer: Heiher <root@heiher.info>

pkgname=tpm-emulator
pkgver=0.7.4
pkgrel=4
pkgdesc="TPM Emulator"
arch=('i686' 'x86_64')
url="http://tpm-emulator.berlios.de"
license=('GPL2')
depends=('gmp')
makedepends=('cmake' 'linux-headers')
install=${pkgname}.install
source=(http://prdownload.berlios.de/tpm-emulator/tpm_emulator-${pkgver}.tar.gz
        tpmd.service 80-tpmd_dev.conf linux-hacks.diff)
sha256sums=('4e48ea0d83dd9441cc1af04ab18cd6c961b9fa54d5cbf2c2feee038988dea459'
            'd0172bc55fd63db8f00664833ce019548172df1a0bf21988afcda04a821ed88f'
			'59d6e213b54d9eaf7ecfc482a3aab22c176448676527adc2b475a5448e2afebc'
			'0a34f9844743b049a62057aa2515fb0f0412954b23f869c1248399cf5f56443a')

build() {
  cd ${srcdir}/tpm_emulator-${pkgver}
  patch -Np1 -i ${srcdir}/linux-hacks.diff
  ./build.sh
}

package() {
  cd ${srcdir}/tpm_emulator-${pkgver}/build
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/usr/local/* ${pkgdir}/usr/
  rm -rf ${pkgdir}/usr/local ${pkgdir}/usr/lib/libtddl.a
  mv ${pkgdir}/lib/modules/`uname -r`/extra ${pkgdir}/lib/modules/`uname -r`/extramodules
  install -Dm644 ${srcdir}/80-tpmd_dev.conf ${pkgdir}/etc/modules-load.d/80-tpmd_dev.conf
  install -Dm644 ${srcdir}/tpmd.service ${pkgdir}/usr/lib/systemd/system/tpmd.service
}

