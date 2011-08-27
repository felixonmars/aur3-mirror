# Berseker  <berseker86 at gmail dot com>
pkgname=mplayer-terminal
pkgver=0.1
pkgrel=1
pkgdesc="A simple script for starting movies and other media files in Mplayer in a Terminal session from any File Manager"
arch=('any')
url="http://berseker86.altervista.org"
license=('GPL')
groups=()
depends=('mplayer' 'xterm')
install=mplayer-terminal.install
source=(
mplayer-terminal.desktop
mplayer-terminal
)

build() {
        cd "$startdir"
        install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -D -m755 "mplayer-terminal.desktop" "$pkgdir/usr/share/applications/mplayer-terminal.desktop"
}



md5sums=('576e4061ae8e47eed0266bd75fe23567'
         '5b32655411505ebcbc357c5552cef560')
