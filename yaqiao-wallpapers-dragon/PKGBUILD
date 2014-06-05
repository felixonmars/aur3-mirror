# Artworks: Ya Qiao (亞桥)
#Packager: FadeMind
pkgname=yaqiao-wallpapers-dragon
_themename=wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="Ya Qiao Wallpapers Dragon"
arch=('any')
url="http://yaqiaonow.blogspot.com/2014/05/wallpaper-ya-qiao-dragon-15-colors.html"
license=('CCPL')
#source=(yaqiao-dragon.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://copy.com/IrCxPXnRxZ6v/yaqiao-dragon.tar.gz?download=1)
md5sums='ed43ccd1b950280e8c5d400b07a04ba1'

package() {
  install -dm755 $pkgdir/usr/share/
  mv $srcdir/$_themename $pkgdir/usr/share/
}  
