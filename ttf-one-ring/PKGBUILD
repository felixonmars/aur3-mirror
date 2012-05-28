pkgname=ttf-one-ring
pkgver=1.1
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="The One Ring is font inspired Lord of the Rings trilogy."
url="http://arvandor.blogspot.com"
arch=('any')
license=('freeware')
source=($pkgname-$pkgver.zip::http://dl.dropbox.com/u/7773489/PKG/gaut-fonts_the-one-ring.zip)
install=$pkgname-$pkgver.install
md5sums=('00428f6eea7f1da6267ae925b3f79b89')

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

