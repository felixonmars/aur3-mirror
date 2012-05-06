# Maintainer: Ner0

pkgname=orta-gtk3-theme
pkgver=20120505
pkgrel=1
pkgdesc="A GTK 3 port of the popular Orta theme (includes GTK 2 theme)"
arch=('any')
url="http://rebek94.deviantart.com/art/Orta-theme-for-Ubuntu-Unity-12-04-297447428"
license=('GPL')
depends=('gtk-engine-unico')
optdepends=('gtk-engine-murrine: For GTK 2 apps'
            'orta-openbox-theme: An Openbox theme [AUR]')
conflicts=('orta-gtk-theme')
source=("http://www.deviantart.com/download/297447428/orta_theme_for_ubuntu_unity_12_04_by_rebek94-d4x3bwk.zip")
md5sums=('7410aafe8b97f086fb18f18a3b80c9d1')

package() {
  find . -type f -not -name ~\* -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/Orta/{}" \;
}
