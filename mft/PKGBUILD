# Maintainer: Anthony Cornehl <accornehl[at]gmail[dot]com>
# https://github.com/twinshadow/abs
pkgname=mft
pkgver=3.1.0
_pkgrev=-8
_mftver=8
pkgrel=1
pkgdesc="Mellanox firmware tools"
url="http://www.mellanox.com/"
arch=('x86_64' 'i686')
license=('custom:"Mellanox Proprietary License"')
depends=('gcc-libs' 'bash' 'tcl' 'linux-headers')
makedepends=('rpmextract')
# http://www.mellanox.com/page/management_tools
source=("http://www.mellanox.com/downloads/MFT/${pkgname}-${pkgver}${_pkgrev}.tgz")
# cksum start
md5sums=('7f042be57c874e14c5b09db22df7344f')
sha512sums=('2dd729c93b957d980ad4e14886b6cf887f95761237f8cd1d10a704d36f6ad4a349db194278e9bef3459521c7e12aa2b7b4b2a6ca8f334f7bf1f0aa81a24e7a9f')
# cksum end

build() {
  cd "${srcdir}/${pkgname}-${pkgver}${_pkgrev}"
  rpmextract.sh "SRPMS/kernel-mft-${pkgver}-${_mftver}.src.rpm"
  tar xzf "kernel-mft-${pkgver}.tgz"
  cd "kernel-mft-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}${_pkgrev}"
  cd "kernel-mft-${pkgver}"
  mkdir -p "${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/mft"
  cp mst_pciconf.ko "${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/mft/mst_pciconf.o"
  cp mst_pci.ko "${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/mft/mst_pci.o"

  cd "${pkgdir}"
  case "$CARCH" in
    i686)
      rpmextract.sh "${srcdir}/${pkgname}-${pkgver}${_pkgrev}/RPMS/${pkgname}-${pkgver}${_pkgrev}.x86.rpm" ;;
    x86_64)
      rpmextract.sh "${srcdir}/${pkgname}-${pkgver}${_pkgrev}/RPMS/${pkgname}-${pkgver}${_pkgrev}.x86_64.rpm" ;;
    *)
      return 1 ;;
  esac

  cd "${srcdir}/${pkgname}-${pkgver}${_pkgrev}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -rf "${pkgdir}/usr/lib/mft" "${pkgdir}/usr/lib64/mft" "${pkgdir}/usr/bin/mst"
  mv "${pkgdir}/etc/init.d/mst" "${pkgdir}/usr/bin"
  rmdir "${pkgdir}/etc/init.d"
}
