# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgbase=fwts
pkgname=('fwts' 'fwts-efi-runtime-dkms')
pkgver=14.11.00
pkgrel=1
arch=('i686' 'x86_64')
url="https://wiki.ubuntu.com/FirmwareTestSuite/"
license=('GPL2')
options=(!buildflags)
changelog=Changelog
makedepends=('pcre' 'json-c')
source=("http://fwts.ubuntu.com/release/fwts-V${pkgver}.tar.gz")
sha256sums=('12b8c7820221b4df9aeb859356dc3f79beff9e27ce6d3ddc5f36fcf9a56d47bb')

prepare() {
    # not sure if I'm doing it the right way
    cd "${srcdir}/debian"
    sed -i 's/#MODULE_VERSION#/'${pkgver}'/' fwts-efi-runtime-dkms.dkms
    sed -i 's/updates/kernel/' fwts-efi-runtime-dkms.dkms
}

build() {
    cd "${srcdir}"
    autoreconf -ivf
    ./configure --prefix="/usr"
    make
}

package_fwts() {
    pkgdesc="FirmWare Test Suite is a tool to do automatic testing of a PC's firmware"
    depends=('bash' 'glib2' 'pcre' 'json-c')
    conflicts=('fwts-git')
    optdepends=('dialog: fwts-frontend-text - dialog based user interface'
                'fwts-efi-runtime-dkms: UEFI tests'
                'dmidecode: some tests'
                'iasl: some tests'
                'pciutils: some tests')

    cd "${srcdir}"
    make DESTDIR="${pkgdir}" install

    # fwts-collect
    install -m 755 scripts/fwts-collect "${pkgdir}/usr/bin"

    # fwts-frontend-text
    install -m 755 live-image/fwts-frontend-text "${pkgdir}/usr/bin"
    install -m 644 live-image/fwts-live-dialogrc "${pkgdir}/usr/share/${pkgname}"

    # some documentation
    install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 644 README* "${pkgdir}/usr/share/doc/${pkgname}"
}

package_fwts-efi-runtime-dkms() {
    pkgdesc="FirmWare Test Suite efi-runtime kernel module sources"
    install=fwts-efi-runtime-dkms.install
    depends=('dkms' 'fwts')

    cd "${srcdir}"
    install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
    install -m644 efi_runtime/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
    install -m644 debian/fwts-efi-runtime-dkms.dkms "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
