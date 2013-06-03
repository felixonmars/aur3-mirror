# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeworlds-gamerclient
pkgver=4.3
pkgrel=1
_twver=0.6.0
pkgdesc="The Gamer customized version of this 2D shooting game"
arch=('i686' 'x86_64')
url="https://www.teeworlds.com/forum/viewtopic.php?id=6279"
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2')
makedepends=('python' 'bam' 'mesa' 'unzip' 'dos2unix')
provides=('teeworlds')
conflicts=('teeworlds')
source=(http://duneudne.free.fr/source/gamer${pkgver}_src.zip
        https://www.teeworlds.com/files/teeworlds-$_twver-src.tar.gz
        teeworlds.desktop teeworlds.png fix-gcc4.7.patch)
md5sums=('1321f6dca177ebda922d0eedbb8a969f'
         '4d6e5d0fb1b5f0bdf6c5c49714045ef1'
         '3944aaf7a8c19a83510b2b39c4cddf5f'
         '44f39e398409232a0e0a431ed46d8cc8'
         'df6b991c843bc75230bfda4a345e7345')

prepare() {
    # Search files with MS Windows newline characters and fix them all
    _src=$(find src -type f -exec file {} \; | grep CRLF | cut -d: -f1)
    _datasrc=$(find datasrc -type f -exec file {} \; | grep CRLF | cut -d: -f1)
    for file in $_src $_datasrc bam.lua configure.lua; do
        dos2unix -q $file
    done
    
    # Fix compilation in GCC 4.7+
    patch -p1 -i fix-gcc4.7.patch
}

build() {
    cd teeworlds-$_twver-source/

    # copy stuff from Gamer Client source
    cp ../bam.lua .
    cp ../configure.lua .
    cp -rf ../datasrc .
    cp -rf ../src .
    
    bam release
}

package() {
    cd teeworlds-$_twver-source/
    
    # Install data files
    mkdir -p "${pkgdir}"/usr/share/teeworlds/data
    cp -r data/* "${pkgdir}"/usr/share/teeworlds/data

    install -Dm755 teeworlds_gamer "${pkgdir}"/usr/bin/teeworlds
    install -Dm755 teeworlds_srv "${pkgdir}"/usr/bin/teeworlds_srv

    install -Dm644 "${srcdir}"/teeworlds.desktop \
        "${pkgdir}"/usr/share/applications/teeworlds.desktop
    install -Dm644 "${srcdir}"/teeworlds.png \
        "${pkgdir}"/usr/share/pixmaps/teeworlds.png

    install -Dm644 license.txt \
        "${pkgdir}"/usr/share/licenses/teeworlds/license.txt
}
