# Maintainer: Ner0

pkgname=gtk-theme-grayday
pkgver=1.12
pkgrel=1
pkgdesc="A theme inspired by Adwaita-cupertino but looking softer contrasts and less cupertino"
arch=('any')
url="http://gnome-look.org/content/show.php?content=149310"
license=('GPL')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
options=('!strip')
source=("http://gnome-look.org/CONTENT/content-files/149310-GrayDay.tar.gz")
md5sums=('b1b1f26ce16d5b5e58defb5fe2192337')


package() {
  find GrayDay/ -type f -not -name '*.tar.gz' -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
