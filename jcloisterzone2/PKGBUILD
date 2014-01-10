# Maintainer: Snowball239 <sashapolo239[at]gmail[dot]com>

pkgname=jcloisterzone2
pkgver=2.6
pkgrel=1
pkgdesc="A Java implementation of the popular board game Carcassonne"
progname=jcloisterzone
arch=('any')
license=('AGPL3')
url="http://jcloisterzone.com/"
depends=('java-environment')
provides=('jcloisterzone')
conflicts=('jcloisterzone')
source=("http://jcloisterzone.com/builds/JCloisterZone-${pkgver}.zip"
        "${progname}.desktop"
        "${progname}.launcher"
        "${progname}.png")
sha256sums=('fc96795d5092a4b363c71e7346bc9926538471d71549e13b8cf6e156bed1550b'
            'b797e5bd69cd9f450935d3869e5352e727bbb9eb52dd0994775b931163aa3c01'
            'a65e0670137634e3e6cd63ff37147e71f459c2cb5f088be539bdb319e0803b9f'
            '012a090df7f1fa30fe3ede444eab92cb2f6fd3c37e1b6786f04da9feb3f7cf38')

package() {
    cd "${srcdir}"

    install -Dm755 "${srcdir}/${progname}.launcher" \
        "${pkgdir}/usr/bin/${progname}"
    install -Dm644 "${srcdir}/JCloisterZone/JCloisterZone.jar" \
        "${pkgdir}/usr/share/${progname}/${progname}.jar"
    install -Dm644 "${srcdir}/JCloisterZone/config.yaml" \
        "${pkgdir}/usr/share/${progname}/config.yaml"
    cp -r "${srcdir}/JCloisterZone/plugins" \
        "${pkgdir}/usr/share/${progname}/plugins"

    install -Dm644 "${srcdir}/${progname}.desktop" \
        "${pkgdir}/usr/share/applications/${progname}.desktop"
    install -Dm644 "${srcdir}/${progname}.png" \
        "${pkgdir}/usr/share/pixmaps/${progname}.png"
}

