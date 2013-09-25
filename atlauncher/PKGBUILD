# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=atlauncher
pkgver=latest
pkgrel=1
pkgdesc="The ATLauncher Minecraft mod pack manager and launcher."
arch=('i686' 'x86_64')
url="http://www.atlauncher.com"
license=('CCPL')
depends=('java-runtime' 'xorg-server-utils' 'openal')
provides=('atlauncher')

install='atlauncher.install'

source=("ATLauncher.jar"
        "atlauncher"
        "atlauncher.desktop"
        "atlauncher.png"
        "LICENSE")

md5sums=('09f9bf049806ba21a4c3712bad73d9ab'
        '9dcb29afaab4ac7f2a391c82ca893e3f'
        'bb6c25c948b8d2341a27803c123df453'
        '8ab8a70ca8c7dbff0dc23bec40a5a923'
        '5367190077e12a7f55403d531ef3998e')


package() {
    cd "$srcdir"
    mkdir -p "${pkgdir}/usr/share/atlauncher/"
    chmod -R 777 "${pkgdir}/usr/share/atlauncher/"

    install -D -m755 "${srcdir}/atlauncher"         "${pkgdir}/usr/bin/atlauncher"
    install -D -m666 "${srcdir}/ATLauncher.jar"     "${pkgdir}/usr/share/atlauncher/ATLauncher.jar"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/atlauncher.desktop" "${pkgdir}/usr/share/applications/atlauncher.desktop"
    install -D -m644 "${srcdir}/atlauncher.png"     "${pkgdir}/usr/share/pixmaps/atlauncher.png"

    # License
    install -D -m644 "${srcdir}/LICENSE"           "${pkgdir}/usr/share/licenses/atlauncher/LICENSE"
}

# vim:set ts=4 sw=4 et:
