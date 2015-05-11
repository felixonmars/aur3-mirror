# Maintainer: Tanguy ALEXIS <tanguy@metatux.fr>

pkgname=scrolls-testserver
pkgver=latest
pkgrel=4
pkgdesc="You use the power of creatures, spells, and ancient machines to gain the edge in battle, deploying your forces by using scrolls."
arch=('x86_64')
license=('custom')
url="https://www.scrolls.com/"
depends=('glu')
source=( scrolls-testserver 
http://download.scrolls.com/clienttest/linux.tar.gz
         scrolls.desktop scrolls.png LICENSE)
md5sums=('64603af19c10e51d0416d744f5f3a2b7'
         'SKIP'
         '747f834cfc610de38986a47d95289f8e'
         '73f17d8db78f23e135effae241e1f2a8'
         'be2ab8f5aba79a6060c12cc23b9c8a2c')

package() {
    cd "$srcdir"
    tar xvzf "${srcdir}/linux.tar.gz"
    mkdir -p "${pkgdir}/usr/share/scrolls-testserver"
    cp -r "${srcdir}/ScrollsTest_Data" "${pkgdir}/usr/share/scrolls-testserver/ScrollsTest_Data"
    chmod -R 755 "${pkgdir}/usr/share/scrolls-testserver/ScrollsTest_Data"
    install -D -m755 "${srcdir}/ScrollsTest"     "${pkgdir}/usr/share/scrolls-testserver/ScrollsTest"
    install -D -m755 "${srcdir}/scrolls-testserver"         "${pkgdir}/usr/bin/scrolls-testserver"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/scrolls.desktop" "${pkgdir}/usr/share/applications/scrolls-testserver.desktop"
    install -D -m644 "${srcdir}/scrolls.png"     "${pkgdir}/usr/share/pixmaps/scrolls-testserver.png"

    # License
    install -D -m644 "${srcdir}/LICENSE"           "${pkgdir}/usr/share/licenses/scrolls-testserver/LICENSE"
}

# vim:set ts=4 sw=4 et:
