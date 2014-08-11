# Contributor: Drew Liszewski <drew dot liszewski at gmail dot com>
# Maintainer: Cornholio <vigo.the.unholy.carpathian@gmail.com>
pkgname=emulationstation-git-unstable
_gitname=EmulationStation
pkgver=1.0.0.r395.gfb16dd8
pkgrel=1
pkgdesc="A graphical front-end for emulators with controller navigation. Developed for the Raspbery Pi, but runs on most Linux systems. This is the unstable branch."
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/Aloshi/EmulationStation"
license=('MIT')
groups=()
makedepends=('git' 'boost' 'freetype2' 'eigen' 'cmake' 'mesa' 'libsm')
depends=('alsa-lib' 'sdl2' 'boost-libs' 'freeimage' 'ttf-dejavu' 'glu')
provides=('emulationstation')
conflicts=('emulationstation-git')
if [ "$CARCH" = "armv6h" ]; then
depends+=('raspberrypi-firmware')
else
depends+=('libgl')
fi
source=('git://github.com/Aloshi/EmulationStation.git#branch=unstable'
        'http://emulationstation.org/downloads/themes/simple_latest.zip')
md5sums=('SKIP'
         '052bca5ca5f6f53d113addb63710991a')

pkgver() {
    cd $_gitname
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    mkdir ${_gitname}/build
    cd ${_gitname}/build
    cmake ..
    make
}

package() {
    cd $_gitname
    install -Dm755 "$srcdir/EmulationStation/emulationstation" "$pkgdir/usr/bin/emulationstation"
    install -Dm644 "$srcdir/EmulationStation/LICENSE.md" "$pkgdir/usr/share/licenses/emulationstation-git/LICENSE"
    install -m755 -d "$pkgdir/etc/emulationstation/themes"
    unzip -d "$pkgdir/etc/emulationstation/themes" "$srcdir/simple_latest.zip"
}
