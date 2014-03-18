pkgname=ttf-bauhaus93
pkgver=1.0
pkgrel=2
pkgdesc="Bauhaus 93 font"
license=('URW++')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
url=("http://www.fontsner.com")
source=("http://www.fontsner.com/download/2700-bc0c5111c81a2ba959c44aa22b982a71.ttf")
sha256sums=('0fb8628874000554dc242716f74d4555308f790dd21a0ce40b917f89f2232141')
install=$pkgname.install

build() {
	mv $srcdir/2700-bc0c5111c81a2ba959c44aa22b982a71.ttf $srcdir/Bauhaus_93.ttf
}

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership $srcdir/Bauhaus_93.ttf "$pkgdir/usr/share/fonts/TTF/"
}
