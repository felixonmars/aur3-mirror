# Maintainer : Martin Wimpress <code@flexion.org>

pkgname="raidar"
pkgver="4.3.8"
pkgrel="3"
_pkgver="4_3_8"
pkgdesc="Discover ReadyNAS devices on the network and start the ReadyNAS web-based configuration utility."
arch=('any')
depends=('java-runtime' 'xdg-utils')
url="http://kb.netgear.com/app/answers/detail/a_id/20684/"
license=('custom')
options=('!strip')
source=("http://www.downloads.netgear.com/files/ReadyNAS/RAIDar_Linux_${_pkgver}.rpm")
md5sums=('a30d60fd07e923189ced2818f3df9fe6')

package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    mkdir -p "${pkgdir}/usr/share/applications/"
    cat << DESKTOP > "${pkgdir}/usr/share/applications/RAIDar.desktop"
#!/usr/bin/env xdg-open
[Desktop Entry]
Type=Application
Name=RAIDar
Exec=/usr/bin/sh "/opt/RAIDar/RAIDar"
Icon=/opt/RAIDar/.install4j/RAIDar.png
Categories=System;
DESKTOP

    # Link the "executable"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/RAIDar/RAIDar "${pkgdir}/usr/bin/RAIDar"

    # Correct file permissions
    find "${pkgdir}/opt/RAIDar" -type 'f' -exec chmod 644 '{}' \;
    find "${pkgdir}/opt/RAIDar" -type 'd' -exec chmod 755 '{}' \;
    chmod 755 "${pkgdir}/opt/RAIDar/RAIDar"
    chmod 755 "${pkgdir}/opt/RAIDar/CheckUpdate"

    # Install license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp "${pkgdir}/opt/RAIDar/HelpDoc/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
