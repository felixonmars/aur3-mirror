# Artworks: Ya Qiao (亞桥)
#Packager: FadeMind
pkgname=yaqiao-wallpapers-hokkaidohoney
_themename=wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="Ya Qiao Wallpapers Hokkaido Honey"
arch=('any')
url="http://yaqiaonow.blogspot.com/2014/06/wallpaper-manjaro-hokkaido-honey-25.html"
license=('CCPL')
#source=(yaqiao-hokkaidohoney.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://copy.com/MTuQYHjtQvDq/yaqiao-hokkaidohoney.tar.gz?download=1)
md5sums='279b919c285d181ca16ee2ea19a00a4c'

package() {
  install -dm755 $pkgdir/usr/share/
  mv $srcdir/$_themename $pkgdir/usr/share/
}  
