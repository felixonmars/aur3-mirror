pkgname=ttf-against-myself
pkgver=1.0
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Against Myself font from urbanfonts.com"
arch=('any')
source=('http://www.urbanfonts.com/download.php?file=againstmyself.zip')
md5sums=('1e7f82c1619157cb543a3b78bb3c3d38')
install=$pkgname.install
license=("custom: Free for personal use")
url=("http://www.urbanfonts.com/fonts/against_myself.htm")

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
