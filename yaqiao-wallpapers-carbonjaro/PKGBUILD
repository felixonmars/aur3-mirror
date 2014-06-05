# Artworks: Ya Qiao (亞桥)
#Packager: FadeMind
pkgname=yaqiao-wallpapers-carbonjaro
_themename=wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="Ya Qiao Wallpapers Carbonjaro"
arch=('any')
url="http://yaqiaonow.blogspot.com/2014/05/wallpaper-manjaro-carbonjaro-18-colors.html"
license=('CCPL')
#source=(yaqiao-carbonjaro.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://copy.com/qzmHv7pZneyJ/yaqiao-carbonjaro.tar.gz?download=1)
md5sums='b76b4b837c43ef6ce9bb420db88df9d1'

package() {
  install -dm755 $pkgdir/usr/share/
  mv $srcdir/$_themename $pkgdir/usr/share/
}  
