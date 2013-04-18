# Maintainer: Ner0
# Contributors: tanuva, qwer1234

pkgname=gtk-theme-gnome-cupertino
pkgver=2.1.5
pkgrel=1
pkgdesc="Gnome Cupertino GTK3 theme for Gnome Shell and Cinnamon"
arch=('any')
url="http://gnome-look.org/content/show.php?content=147061"
license=('GPL3')
depends=('gtk-engine-murrine')
conflicts=('gtk-theme-gnome-cupertino-glassy' 'gtk-theme-gnome-cupertino-unity' 'gtk-theme-adwaita-cupertino-glassy')
replaces=('gtk-theme-adwaita-cupertino')
options=('!strip')
source=("http://gnome-look.org/CONTENT/content-files/147061-Gnome-Cupertino-$pkgver.tar.gz")
install=gtk-theme-gnome-cupertino.install
md5sums=('31d0aafd3e8fc008bc4078ee99d76b1b')

package() {
  find Gnome-Cupertino{,*} -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
