# Maintainer: crazyelf5

pkgname=light-themes-marlinesque
pkgver=20120213
pkgrel=1
pkgdesc="A variation of Ambiance and Radiance themes tailored for Marlin."
url="http://ammonkey.deviantart.com/art/Light-Themes-Marlinesque-284993066"
license=('GPL')
arch=('any')
depends=('gtk3>=3.3.14' 'gtk-engine-unico')
optdepends=('marlin-bzr: A sleek and fast GTK3 file manager [AUR]'
            'gtk-engine-murrine: For GTK 2 apps')
source=("http://www.deviantart.com/download/284993066/light_themes_marlinesque_by_ammonkey-d4poe22.zip")
md5sums=('70cd47b4fb1d941727f42d73cd8a1bb1')

package() {
  cd "$srcdir/$pkgname"
  for i in `ls | grep Marlinesque`; do find "$i" -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;; done
}
