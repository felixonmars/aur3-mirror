# Maintainer: Denis Kalitinkin <denis.kalitinkin.dev@gmail.com>

pkgname=panasonic-mccgdi
pkgver=2.0.7
pkgrel=2
pkgdesc="Panasonic Printer Driver"
arch=('i686' 'x86_64')
url="http://panasonic.net/pcc/support/fax/common/table/linuxdriver.html"
license=('custom')
provides=('panasonic-mccgdi')
depends=('cups')
source=("http://cs.psn-web.net/support/fax/common/file/Linux_PrnDriver/Driver_Install_files/mccgdi-${pkgver}-${CARCH}.tar.gz")
[ "$CARCH" = "i686" ] && md5sums=('2afae07231f2458a7f5f1e5899c4aa83')
[ "$CARCH" = "x86_64" ] && md5sums=('528c3dd82366d6e9661aabd0d6679ecf')

package() {
    cd "${srcdir}/mccgdi-${pkgver}-${CARCH}"

    lib_path="${pkgdir}/usr/lib"
    model_path="${pkgdir}/usr/share/cups/model"
    filter_path="${pkgdir}/usr/lib/cups/filter"
    install_path="${pkgdir}/usr/local/share/panasonic/printer"

    install -Dm644 "Version.html" "${install_path}/Version.html"

    install -Dm4755 "panautil/L_H0JDUCZAZ" "${install_path}/bin/L_H0JDUCZAZ"
    install -Dm755 "panautil/L_H0JDUIZAZ" "${install_path}/bin/L_H0JDUIZAZ"
    install -Dm644 "panautil/L_H0JDUIZAZ.png" "${install_path}/bin/L_H0JDUIZAZ.png"

    mkdir -m777 "${install_path}/conf"

    find data/ -type f -exec install -Dm644 '{}' "${install_path}/{}" \;

    mkdir -pm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "panautil/L_H0JDUIZAZ.desktop" "${pkgdir}/usr/share/applications/panasonic-printer-settings.desktop"

    install -Dm755 "lib/L_H0JDJCZAZ.so.1.0.0" "${lib_path}/L_H0JDJCZAZ.so.1.0.0"
    ln -sfr "${lib_path}/L_H0JDJCZAZ.so.1.0.0" "${lib_path}/L_H0JDJCZAZ.so.1"
    ln -sfr "${lib_path}/L_H0JDJCZAZ.so.1.0.0" "${lib_path}/L_H0JDJCZAZ.so"

    install -Dm755 "filter/L_H0JDGCZAZ" "${filter_path}/L_H0JDGCZAZ"

    ppd_files=$(find ppd/ -name *.ppd)
    for ppd in $ppd_files ; do
	install -Dm644 "$ppd" "${model_path}/panasonic/"$(basename "$ppd")
    done
}

