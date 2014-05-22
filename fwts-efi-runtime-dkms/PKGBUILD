# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=fwts-efi-runtime-dkms
pkgver=14.05.00
pkgrel=1
pkgdesc="FirmWare Test Suite efi-runtime kernel module sources"
arch=('any')
url="https://wiki.ubuntu.com/FirmwareTestSuite/"
license=('GPL2')
depends=('dkms')
changelog=Changelog
install=${pkgname}.install
source=("http://fwts.ubuntu.com/release/fwts-V${pkgver}.tar.gz")
sha256sums=('962e9c67ff27e557ddf4841c8b74b30866ba1d923ea8aaec878f2584b4def611')

# not sure if I'm doing it the right way
prepare() {
    cd "${srcdir}/debian"
    sed -i 's/#MODULE_VERSION#/'${pkgver}'/' fwts-efi-runtime-dkms.dkms
    sed -i 's/updates/kernel/' fwts-efi-runtime-dkms.dkms
}

package() {
    cd "${srcdir}"
    install -dm755 ${pkgdir}/usr/src/${pkgname}-${pkgver}
    install -m644 efi_runtime/* ${pkgdir}/usr/src/${pkgname}-${pkgver}
    install -m644 debian/fwts-efi-runtime-dkms.dkms ${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf
}
