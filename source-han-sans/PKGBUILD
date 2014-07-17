# Maintainer: dant mnf <dantmnf2@gmail.com>

pkgname=source-han-sans
pkgver=1.000
pkgrel=3
pkgdesc="a sans serif Pan-CJK font family by Adobe and Google (multilingual package)"
arch=('any')
license=('APACHE')
install=source-han-sans.install
url="http://sourceforge.net/projects/source-han-sans.adobe/"
depends=('fontconfig' 'xorg-font-utils')
source=("http://sourceforge.net/projects/source-han-sans.adobe/files/SourceHanSansOTC-${pkgver//_/-}.zip"
        "LICENSE.txt")
sha256sums=('d6eb107eaf7f7b7e6b775905e2f5b335c989c7b06a46fc7286d3e71c4ffde4d8'
            '9f3140868c9447ed9c2d225d28a3d2f750fe005f7b2c0b57e3f8fc70f3f88bee')
package() {
  cd "$srcdir"
  bsdtar xf "SourceHanSansOTC-${pkgver//_/-}.zip" # not write in makedepend because makepkg depends it
  install -d "$pkgdir/usr/share/fonts/$pkgname/"
  for file in $srcdir/SourceHanSansOTC-${pkgver//_/-}/*.ttc
  do
    install -Dm644 "$file" "$pkgdir/usr/share/fonts/$pkgname"
  done    
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
