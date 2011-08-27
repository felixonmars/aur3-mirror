pkgname=pixel
pkgver=1.0.741
pkgrel=1
pkgdesc="Pixel Image Editor - a cross-platform image editor"
url="http://www.kanzelsberger.com/pixel/"
license=('custom')
depends=('freetype2' 'libpng' 'sdl' 'libxi' 'openexr' 'aspell' 'lcms' 'cups' 'sane')
makedepends=()
source=(pixel-${pkgver}-linux.x86.tar.bz2 pixel.desktop)
install=
md5sums=('f782792638317630a7b2d62baedb7218' '37fefe33cbf933f453c012502d49ac1f')
arch=('i686')

build() {
    cd $startdir/pkg/
    mkdir -p usr/share/pixel usr/bin usr/share/licenses/pixel usr/share/applications usr/share/pixmaps

    cp -r ${startdir}/src/Pixel/* usr/share/pixel
    cp usr/share/pixel/license.txt usr/share/licenses/pixel

    cp ${startdir}/src/pixel.desktop usr/share/applications
    cp usr/share/pixel/icon48.png usr/share/pixmaps/pixel.png

    cd ${startdir}/pkg/usr/bin
    ln -s /usr/share/pixel/pixel pixel

}
