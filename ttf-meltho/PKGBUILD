pkgname=ttf-meltho
pkgver=1.21
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Meltho Syriac fonts"
arch=('any')
url=('http://www.bethmardutho.org/index.php/download/fonts.html')
license=('custom')
source=(http://www.bethmardutho.org/images/fonts/melthofonts-$pkgver.zip)
install=$pkgname.install
sha512sums=('26a5fa965001374447fa7887dc30d0ed9d032c3aef3af42305e2cea2d0627595c1bfc395f2e0f00bfffd680fd6138a3a0bd480110dd991aa66a79c0b1a5f23ea')
build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/melthofonts-$pkgver/*.otf $pkgdir/usr/share/fonts/TTF
  install -Dm644 $srcdir/melthofonts-$pkgver/license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
