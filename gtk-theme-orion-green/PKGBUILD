# Maintainer: Ner0
# modified to suit a dark theme
# by Mr Green
pkgname=gtk-theme-orion-green
pkgver=1.3
pkgrel=1
pkgdesc="A modern and light GTK theme"
arch=('any')
url="http://deviantart.com/view/281431756"
license=('GPL3')
depends=('gtk-engine-unico')
optdepends=('gtk-engine-murrine: For GTK-2 apps')
conflicts=('orion-gtk-theme')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shimmerproject/Orion/archive/v$pkgver.tar.gz")
md5sums=('7f27748cf771afcbf8260aa5f8f9cb94')

package() {
  cd Orion-$pkgver
  find . -type f -not -name .gitignore -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/Orion-Green/{}" \;
  # change colour scheme
	sed -i 's/569be4/6B8264/g' $pkgdir/usr/share/themes/Orion-Green/gtk-2.0/gtkrc 
  sed -i 's/569be4/6B8264/g' $pkgdir/usr/share/themes/Orion-Green/gtk-3.0/settings.ini
	sed -i 's/569be4/6B8264/g' $pkgdir/usr/share/themes/Orion-Green/gtk-3.0/gtk.css
	sed -i 's/569be4/6B8264/g' $pkgdir/usr/share/themes/Orion-Green/openbox-3/themerc
	sed -i 's/67acf5/6B8264/g' $pkgdir/usr/share/themes/Orion-Green/openbox-3/themerc
  sed -i 's/458ad3/6B8264/g' $pkgdir/usr/share/themes/Orion-Green/openbox-3/themerc
}

