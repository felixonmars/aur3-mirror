pkgname=ttf-fanjofey-ah
pkgver=1.1
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Fanjofey AH is a fantasy elven font."
url="http://arvandor.blogspot.com"
arch=('any')
license=('freeware')
source=($pkgname-$pkgver.zip::http://dl.dropbox.com/u/7773489/PKG/Fonts/fanjofey_ah.zip)
install=$pkgname-$pkgver.install
md5sums=('552a94d85d16bf5500fb2742fe2fea35')

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

