pkgname=ttf-hobbiton-brush-hand
pkgver=1.1
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Hobbiton Brush Hand is a font inspired by hobbits in LotR trilogy."
url="http://arvandor.blogspot.com"
arch=('any')
license=('custom:freeware')
source=($pkgname-$pkgver.zip::http://dl.dropbox.com/u/7773489/PKG/Fonts/hobbiton_brush_hand.zip)
install=$pkgname-$pkgver.install
md5sums=('ceb55cfc66493424ff2bbd43313bf0cb')

build()
{
  cd "$srcdir"
  unzip $pkgname-$pkgver
}

package()
{
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}

