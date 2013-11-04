# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=music-player-git
pkgver=v1.e9909d9
pkgrel=1
pkgdesc="Simple Music Player using GTK3.10 created by Ikey Doherty. Written in C. Supports video."
arch=('i686' 'x86_64')
url="https://github.com/ikeydoherty/music-player"
license=('GPL2')
depends=('gtk3' 'gst-plugins-base-libs' 'id3lib')
makedepends=('git')
conflicts=('musicplayer')
provides=('musicplayer')
source=("$pkgname"::'git+https://github.com/ikeydoherty/music-player.git#branch=master')
md5sums=('SKIP')

pkgver() {
     cd "$srcdir/$pkgname"
     echo "$(git describe --tags).$(git describe --always)"
}

build() {
     cd "$srcdir/$pkgname"
     ./autogen.sh
     make
}

package() {
     cd "$srcdir/$pkgname"
     make PREFIX=/usr DESTDIR="$pkgdir" install
     install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
     install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
