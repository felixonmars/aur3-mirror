# Maintainer: Prurigro
# Contributor: Prurigro

pkgname=cutepad
pkgver=0.1
pkgrel=1
pkgdesc="A modern text editor based on Qt framework. "
url="http://sourceforge.net/projects/${pkgname}"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('qt4')
source=("http://sourceforge.net/projects/cutepad/files/CutePad_Source_Mingw32.zip"
        "cutepad.desktop")
sha256sums=('0b5e305b73772c8230f6acb7d0a6af8b7b41bd2b0bfb439e89ebfa3f30fecba9'
            '927b167e305f344fb25651259fdc4bc35a39a4e05356207198d22319c7448e35')

prepare() {
    cd "${srcdir}/CutePad_Source"
    find . -type f -exec sed -i 's/addLink/addlink/g' '{}' \;
}

build() {
    cd "${srcdir}/CutePad_Source"
    qmake-qt4
    make
}

package() {
    install -Dm755 "${srcdir}/CutePad_Source/CutePad" "${pkgdir}/usr/bin/cutepad"
    install -Dm644 "${srcdir}/CutePad_Source/Images/icon.png" "${pkgdir}/usr/share/pixmaps/cutepad.png"
    install -Dm644 "${srcdir}/cutepad.desktop" "${pkgdir}/usr/share/applications/cutepad.desktop"
}
