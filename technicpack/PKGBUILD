# Maintainer: Haydania-Capri <me@capri.pw>

pkgname=technicpack
pkgver=latest
pkgrel=1
pkgdesc="An open-world game whose gameplay revolves around breaking and placing blocks"
arch=(any)
license=('custom')
url="http://www.technicpack.net/"
depends=('java-runtime' 'xorg-server-utils' 'openal')
noextract=('technicpack.jar')
source=(technicpack http://launcher.technicpack.net/launcher/431/TechnicLauncher.jar
         technicpack.desktop technicpack.png LICENSE)
md5sums=('0067a06384990323449dfda7b214d9f4'
         'SKIP'
         'e016572c17a449541180e6e5c6b9766c'
         '8efff0ff856458f8ae97876294180c74'
         'b82eddf7100b63e2fc52e53028327589')

package() {
    cd "$srcdir"

    install -D -m755 "${srcdir}/technicpack"         "${pkgdir}/usr/bin/technicpack"
    install -D -m644 "${srcdir}/TechnicLauncher.jar"     "${pkgdir}/usr/share/technicpack/technicpack.jar"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/technicpack.desktop" "${pkgdir}/usr/share/applications/technicpack.desktop"
    install -D -m644 "${srcdir}/technicpack.png"     "${pkgdir}/usr/share/pixmaps/technicpack.png"

    # License
    install -D -m644 "${srcdir}/LICENSE"           "${pkgdir}/usr/share/licenses/technicpack/LICENSE"
}
