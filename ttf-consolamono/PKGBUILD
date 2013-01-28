# Maintainer: Raphael Kubo da Costa <kubito@gmail.com>

pkgname=ttf-consolamono
pkgver=2.001
pkgrel=1
pkgdesc="Monospace font especially created for programming, text editors and terminal-use"
arch=(any)
url="http://openfontlibrary.org/en/font/consolamono"
license=('custom:OFL')
depends=(fontconfig xorg-fonts-encodings xorg-font-utils)
makedepends=(unzip)
install=
changelog=
source=("http://openfontlibrary.org/assets/downloads/consolamono/61cc2afcc4eca96efe7c6ebf178d39df/consolamono.zip")
md5sums=('61cc2afcc4eca96efe7c6ebf178d39df')

package() {
  cd "$srcdir/Consola Mono"

  install -d "$pkgdir"/usr/share/fonts/TTF
  install -d "$pkgdir"/usr/share/licenses/"$pkgname"
  install -d "$pkgdir"/usr/share/doc/"$pkgname"

  install -m644 ConsolaMono.ttf ConsolaMono-Bold.ttf \
      "$pkgdir"/usr/share/fonts/TTF

  install -m644 "SIL - Open Font License.txt" \
      "$pkgdir"/usr/share/licenses/"$pkgname"

  install -m644 "FONTLOG.txt" \
      "$pkgdir"/usr/share/doc/"$pkgname"
}
