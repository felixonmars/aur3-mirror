# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Alexandr Grigorcea <cahr.gr@gmail.com>

pkgname=nuvola-bzr
pkgver=1.7.6.773.7bab235
pkgrel=1
pkgdesc="Integrated Google Music, Grooveshark, 8tracks and Hype Machine player."
arch=(i686 x86_64)
url=https://launchpad.net/nuvola-player
license=(GPL3)
depends=(gtk3 libgee06 libnotify libsoup libunique libx11 python2 webkitgtk)
makedepends=(bzr intltool libdbusmenu scour vala)
optdepends=('gnome-shell-extension-mediaplayer-git: Gnome Shell integration'
    'tsocks: Socks proxy support')
conflicts=(google-music-frame-bzr)
replaces=(google-music-frame-bzr)
install=$pkgname.install
source=($pkgname::bzr+http://bazaar.launchpad.net/~fenryxo/nuvola-player/trunk/)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    echo $(awk '/VERSION=/ { gsub(/[^0-9.]/, "", $1); print $1 }' waf).$(bzr revno).$(bzr testament | awk '/sha1/ { print $2 }' | head -c7)
}

build() {
    cd $pkgname/
    LDFLAGS+=" -ldl"
    python2 ./waf configure --prefix=/usr
    python2 ./waf build $MAKEFLAGS --skip-tests
}

package() {
    cd $pkgname/
    python2 ./waf install --destdir="$pkgdir"
}
