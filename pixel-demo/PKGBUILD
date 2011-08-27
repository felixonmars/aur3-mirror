#Contributor: Tony Dodd <arch@recalcitrance.net>
pkgname=pixel-demo
pkgver=1.0.699
pkgrel=1
pkgdesc="Pixel Image Editor - a cross-platform image editor"
url="http://www.kanzelsberger.com/pixel/"
license=('custom')
depends=('freetype2' 'libpng' 'sdl' 'libxi' 'openexr' 'aspell' 'lcms')
makedepends=()
source=(http://www.pixelcommunity.com/bin/pixeldemo_${pkgver}-1_i386.deb)
install=
md5sums=('fb3fecfb5d8e7d8571a432e3ac60e6b9')
arch=('i686')
conflicts=('pixel')

build() {
    cd $startdir/src/
    ar -x pixeldemo_${pkgver}-1_i386.deb
    cd $startdir/pkg/
    tar -xvzf $startdir/src/data.tar.gz

    chmod a+rx -R *
    find . -type f -exec chmod -x \{\} \;
    chmod +x usr/bin/pixeldemo
    rm -r usr/sbin

    mkdir -p usr/share/licenses/pixeldemo
    mv usr/share/doc/pixeldemo/copyright usr/share/licenses/pixeldemo
}
