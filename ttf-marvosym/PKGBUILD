# Maintainer: TDY <tdy@archlinux.info>

pkgname=ttf-marvosym
pkgver=3.10
pkgrel=1
pkgdesc="A symbol font for school and office use"
arch=('any')
url="http://www.marvosym.com/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.marvosym.com/marvosym.zip
        OFL.txt::"http://scripts.sil.org/cms/scripts/render_download.php?site_id=nrsi&format=file&media_id=OFL_plaintext&filename=OFL.txt")
md5sums=('63dc3cfacca7bba0f230b5492d444950'
         '6ed93967ff0dc6dd9c8d31c17f817a06')

package() {
  cd "$srcdir"
  install -Dm644 marvosym.ttf "$pkgdir/usr/share/fonts/TTF/marvosym.ttf"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -Dm644 marvosym.pdf "$pkgdir/usr/share/doc/$pkgname/preview.pdf"
}

# vim:set ts=2 sw=2 et:
