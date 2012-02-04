# $Id: PKGBUILD 46286 2011-05-04 14:14:50Z bluewind $
# Maintainer: quasi <quasi@archlinux.org>

pkgname=synplay
pkgver=20090817
pkgrel=2
pkgdesc="Synder PLAYER - Player for AHX and SID tunes."
arch=('i686 x86_64')
url="http://dawork.synchronus.de"
license=('CUSTOM')
case $CARCH in
    i686) depends=('sdl') ;;
    x86_64) depends=('lib32-sdl') ;;
esac
source=(http://dawork.synchronus.de/wip/synplay.zip)
md5sums=('c6043f4f318bcab5130dcd292f5a2783')

build(){
    mkdir -p "$pkgdir/usr/bin" || return 1
}

package() {
  cp "$srcdir/$pkgname" "$pkgdir/usr/bin/" || return 1
}
