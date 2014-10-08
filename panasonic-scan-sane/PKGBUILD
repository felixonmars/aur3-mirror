# Maintainer: Denis Kalitinkin <denis.kalitinkin.dev@gmail.com>

pkgname=panasonic-scan-sane
pkgver=1.2.1
pkgrel=1
pkgdesc="Panasonic Scanner Driver (sane backend only)"
arch=('i686' 'x86_64')
url="http://panasonic.net/pcc/support/fax/common/table/linuxdriver.html"
license=('custom')
provides=('panasonic-scan-sane')
depends=('sane')
source=("http://cs.psn-web.net/support/fax/common/file/Linux_ScanDriver/panamfs-scan-${pkgver}-${CARCH}.tar.gz")
[ "$CARCH" = "i686" ] && md5sums=('49d4cc98131941fb0e52f3e0924f7a65')
[ "$CARCH" = "x86_64" ] && md5sums=('89e3337d7003e972c74c4718faf0d1ed')

package() {
    cd "${srcdir}/panamfs-scan-${pkgver}-${CARCH}/sane-backend"

    lib_name="libsane-panamfs.so"
    lib_path="${pkgdir}/usr/lib/sane/${lib_name}"
    install -Dm755 "${lib_name}.1.2.0" "${lib_path}.1.2.0"
    ln -sfr "${lib_path}.1.2.0" "${lib_path}.1"
    ln -sfr "${lib_path}.1.2.0" "${lib_path}"

    install -Dm644 panamfs.conf "${pkgdir}/etc/sane.d/panamfs.conf"

    mkdir -pm755 "${pkgdir}/etc/sane.d/dll.d"
    echo 'panamfs' >"${pkgdir}/etc/sane.d/dll.d/10-panamfs.conf"

    mkdir -pm755 "${pkgdir}/usr/lib/udev/rules.d"
    echo >"${pkgdir}/usr/lib/udev/rules.d/49-sane-panamfs.conf" '
ACTION=="add", ATTR{idVendor}=="04da", GOTO="panamfs"
GOTO="panamfs_end"
LABEL="panamfs"
# KX-MC6000
ATTRS{idProduct}=="1509", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# KX-MC6015
# KX-MC6020
ATTRS{idProduct}=="150a", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# KX-MC6040
ATTRS{idProduct}=="150b", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# KX-MC6255
# KX-MC6260
ATTRS{idProduct}=="1511", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# DP-MC210
ATTRS{idProduct}=="0f05", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# KX-MB3000/DP-MB300 series
ATTRS{idProduct}=="0f06", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# KX-MB2000 series
ATTRS{idProduct}=="0f07", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# KX-MB2060 series
ATTRS{idProduct}=="0f08", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# KX-MC6280N
ATTRS{idProduct}=="0f09", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# KX-MB1500 series
ATTRS{idProduct}=="0f0b", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# KX-MB2200/2500,DP-MB250/310 series
ATTRS{idProduct}=="0f0c", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# KX-MB2085/2090 series
ATTRS{idProduct}=="0f0d", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# KX-MB1600 series
ATTRS{idProduct}=="0e5e", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
# KX-MB2100 series
ATTRS{idProduct}=="0e55", MODE="0664", GROUP="scanner", SYMLINK+="scanner%n", ENV{libsane_matched}="yes"
LABEL="panamfs_end"
'
}

