# Maintainer: ne <ne dot tetewi at gmail dot com>

pkgname=dmenu_play
pkgver=0.4
pkgrel=1
url="https://github.com/neeee/dmenu_play"
pkgdesc="Simple script that searches the current mpd playlist with dmenu"
arch=('any')
license=('GPL3')
depends=('mpc' 'dmenu')
source=("$pkgname")

package() {
   	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname" 
}

md5sums=('95d62975438fb416134b02931d3304b5')
