# Maintainer: Patrick.Ulbrich <zulu99 at gmx dot net>
# Contributor: Drew Liszewski <drew dot liszewski at gmail dot com>
# Contributor: Cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=emulationstation-git-unstable-rpi
_gitname=EmulationStation
pkgver=1.0.0.r395.gfb16dd8
pkgrel=3
pkgdesc="A graphical front-end for emulators with controller navigation. This is the unstable branch, optimized for the Raspberry Pi."
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/Aloshi/EmulationStation"
license=('MIT')
groups=()
makedepends=('git' 'boost' 'freetype2' 'eigen' 'cmake' 'mesa' 'libsm' 'unzip')
depends=('alsa-lib' 'sdl2-opengles' 'boost-libs' 'freeimage' 'ttf-dejavu' 'glu')
provides=('emulationstation')
conflicts=('emulationstation-git')

if [ "$CARCH" = "armv6h" ]; then
  depends+=('raspberrypi-firmware' 'fbset')
else
  depends+=('libgl')
fi

source=('git://github.com/Aloshi/EmulationStation.git#branch=unstable'
        'http://emulationstation.org/downloads/themes/simple_latest.zip'
        'runcommand.sh'
        'emulationstation.service')

md5sums=('SKIP'
         '152c9775734aae1eb610714db7fa7bf3'
         '3cfadffb510367ea55ace362fb04f79b'
         'c987f41389fe325dd01c9e2d8e917270')

install='emulationstation.install'

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
    install -Dm755 "$srcdir/runcommand.sh" "$pkgdir/usr/bin/runcommand.sh"
    install -Dm644 "$srcdir/emulationstation.service" "$pkgdir/usr/lib/systemd/system/emulationstation.service"
    install -m755 -d "$pkgdir/etc/emulationstation/themes"
    unzip -d "$pkgdir/etc/emulationstation/themes" "$srcdir/simple_latest.zip"
}
