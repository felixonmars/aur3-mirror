# Contributor: killhellokitty <killhellokitty.deviantart.com>
# Maintainer: killhellokitty <killhellokitty.deviantart.com>

pkgname=varnam-gtk-themes
pkgver=1.46
pkgrel=2
pkgdesc="A kevlar Theme for gtk3, gtk2 & metacity"
arch=('any')
url="http://www.deviantart.com/download/311761289/varnam_gtk_theme_by_killhellokitty-d55m4jt.zip"
license=('GPL')
depends=('gtk-engines' 'gnome-themes-standard>=3.4.1' 'gtk-engine-murrine>=0.98.2' 'gtk-engine-equinox>=1.50' 'gtk-engine-unico>=1.0.2')
source=("${pkgname}-${pkgver}.zip::http://www.deviantart.com/download/311761289/varnam_gtk_theme_by_killhellokitty-d55m4jt.zip")
md5sums=('6138254292eb02d8a7489f9fcf852923')


package() {
  # install themes
  find varNaM*/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
