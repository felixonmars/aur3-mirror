# Artworks: Ya Qiao (亞桥)
#Packager: FadeMind
pkgname=yaqiao-wallpapers-doubleplay
_themename=wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="Ya Qiao Wallpapers Double Play"
arch=('any')
url="http://ya-qiao.blogspot.com/2014/04/wallpaper-manjaro-double-play-28-colors.html"
license=('CCPL')
#source=(yaqiao-doubleplay.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://copy.com/oDBBH6t1LgqJ/yaqiao-doubleplay.tar.gz?download=1)
md5sums='a1bd2af0e8716b832609534941fcfa6a'

package() {
  install -dm755 $pkgdir/usr/share/
  mv $srcdir/$_themename $pkgdir/usr/share/
}  
