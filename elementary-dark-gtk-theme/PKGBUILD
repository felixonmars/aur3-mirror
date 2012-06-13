# Maintainer: Ner0

pkgname=elementary-dark-gtk-theme
pkgver=20120613
pkgrel=1
pkgdesc="A soft and subtle dark theme based on the higly popular elementary theme"
arch=('any')
url="http://satya164.deviantart.com/art/elementary-Dark-GTK3-Theme-244257862"
license=('GPL')
depends=('gtk3>=3.2.0' 'gtk-engine-unico')
optdepends=('gtk-engine-murrine: For GTK-2 apps')
source=("http://www.deviantart.com/download/244257862/elementary_dark___gtk3_theme_by_satya164-d41fakm.zip")
md5sums=('daeda14db36f6a48ae530d38b8995b3c')


package() {
  find elementary\ Dark -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
