# Maintainer: Marius <marius at nsa dot com>

pkgname=gnome-shell-theme-xgnome-enhanced
pkgver=3.10_18.12.2013
pkgrel=1
pkgdesc="Default GNOME Shell theme customization."
url="http://xterminador.deviantart.com/art/XGnome-Enhanced-3-10-394189091"
license=('cc-by-nc-sa-4.0')
arch=('any')
depends=('gnome-shell' 'sony_sketch_ef_font')
optdepends=('gnome-shell-extension-user-theme' 'gnome-tweak-tool')
source=("http://fc06.deviantart.net/fs71/f/2013/352/c/e/xgnome_enhanced_3_10_by_xterminador-d6iou8z.zip")
sha512sums=('32ff25f19d5686f916456ae13d3facb4fabb238a8fd2b7379412789f2b1d2be2ba97175ba868429fbb9ab59a1ac7711ba26b26b17a262c7f6e44a6371af0f429')

package() {
  mkdir -p "$pkgdir/usr/share/themes/"
  cp -r "$srcdir/XGnome Enhanced 3.10" "$pkgdir/usr/share/themes/"
}
