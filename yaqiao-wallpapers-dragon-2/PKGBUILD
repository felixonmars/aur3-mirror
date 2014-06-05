# Artworks: Ya Qiao (亞桥)
#Packager: FadeMind
pkgname=yaqiao-wallpapers-dragon-2
_themename=wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="Ya Qiao Wallpapers Dragon 2"
arch=('any')
url="http://yaqiaonow.blogspot.com/2014/05/wallpaper-manjaro-dragon-2-13-colors.html"
license=('CCPL')
#source=(yaqiao-dragon-2.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://copy.com/khxaLKcB8Mwn/yaqiao-dragon-2.tar.gz?download=1)
md5sums='1e97e5fc99eb0d0d956f5c10fc7a7b3b'

package() {
  install -dm755 $pkgdir/usr/share/
  mv $srcdir/$_themename $pkgdir/usr/share/
}  
