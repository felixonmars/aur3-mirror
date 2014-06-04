# Artworks: Ya Qiao (亞桥)
#Packager: FadeMind
pkgname=yaqiao-wallpapers-industrial
_themename=wallpapers
pkgver=1.0
pkgrel=1
pkgdesc="Ya Qiao Wallpapers Industrial"
arch=('any')
url="http://yaqiaonow.blogspot.com/2014/06/wallpaper-manjaro-industrial-25-colors.html"
license=('CCPL')
#source=(yaqiao-industrial.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://copy.com/acqxNfzYMGMu/yaqiao-industrial.tar.gz?download=1)
md5sums='ae77203fec0f2a24f511c433ef7b1b7c'

package() {
  install -dm755 $pkgdir/usr/share/
  mv $srcdir/$_themename $pkgdir/usr/share/
}  
