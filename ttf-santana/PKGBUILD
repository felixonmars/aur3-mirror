# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=ttf-santana
pkgver=0
pkgrel=2
pkgdesc="A clean, Sans-like font"
arch=('any')
url="http://www.dafont.com/santana.font"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=("ttf-santana.zip::http://img.dafont.com/dl/?f=santana"
        'LICENSE')
md5sums=('841183d6dba85e31d56f2f2fc92aef05'
         '2c529a549be4b0eb15526282e828bad3')
install=ttf.install

package() {
 for file in Santana-Black.ttf Santana-BlackCondensed.ttf Santana-Bold.ttf Santana-RegularCondensed.ttf Santana.ttf SantanaXtraCondensed.ttf; do
  install -Dm 644 "$srcdir/$file" "$pkgdir/usr/share/fonts/TTF/$file"
 done
 install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
