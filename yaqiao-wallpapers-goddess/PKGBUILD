# Artworks: Ya Qiao (亞桥)
#Packager: FadeMind
pkgname=yaqiao-wallpapers-goddess
_themename=wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="Ya Qiao Wallpapers Goddess"
arch=('any')
url="http://yaqiaonow.blogspot.com/2014/05/wallpaper-manjaro-goddess-36-colors.html"
license=('CCPL')
#source=(yaqiao-goddess.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://copy.com/rq2IN3H4sfN1/yaqiao-goddess.tar.gz?download=1)
md5sums='ddd99f4737f28b8adda04f9ae0f0cb98'

package() {
  install -dm755 $pkgdir/usr/share/
  mv $srcdir/$_themename $pkgdir/usr/share/
}  
