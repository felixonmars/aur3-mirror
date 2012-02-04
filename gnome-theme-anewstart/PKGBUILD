# Maintainer: Gordin <9ordin @t googlemail dot com>

pkgname=gnome-theme-anewstart
pkgver=1.3
pkgrel=1
pkgdesc="GTK2, GTK3, Metacity, Unity, Gnome-shell theme by alecive"
arch=('any')
url="http://alecive.deviantart.com/art/A-New-Start-1-3-169100684"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine>=0.98.1.1' 'gtk-engine-unico>=1.0.1')
conflicts=('gnome-shell-theme-anewstart' 'gtk-theme-anewstart')
provides=('gnome-shell-theme-anewstart' 'gtk-theme-anewstart')
source=("http://www.deviantart.com/download/169100684/a_new_start___1_3_by_alecive-d2soex8.zip")
sha256sums=('22dc42c5db21a8cd1c6e22793f41c18d9cfb6092ad16492404c16a792f108934')

package() {
  # fix font definitions
  # sed 's|font:|font-size:|g' -i Zukini/gnome-shell/gnome-shell.css

  # install theme
  cd ANewStart/1*
  find ANewStart/ -not -name *Thumbs.db -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;

  # openbox
  # install -Dm644 openbox-themerc \
  #     "$pkgdir/usr/share/themes/Zukini/openbox-3/themerc"
}

# vim:set ts=2 sw=2 et:
