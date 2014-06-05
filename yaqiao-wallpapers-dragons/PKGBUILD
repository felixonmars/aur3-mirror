# Artworks: Ya Qiao (亞桥)
#Packager: FadeMind
pkgname=yaqiao-wallpapers-dragons
_themename=wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="Ya Qiao Wallpapers Dragons"
arch=('any')
url="http://yaqiaonow.blogspot.com/2014/05/wallpaper-manjaro-dragons-51-colors.html"
license=('CCPL')
#source=(yaqiao-dragons.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://copy.com/3wXnyggZd63y/yaqiao-dragons.tar.gz?download=1)
md5sums='a44f8de744e86ff0f5cf0d34f5378a68'

package() {
  install -dm755 $pkgdir/usr/share/
  mv $srcdir/$_themename $pkgdir/usr/share/
}  
