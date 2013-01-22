# Maintainer: Ilya Medvedev <medved55rus [at] gmail [dot] com>

pkgname=sammy-themes
pkgver=0.7.4
pkgrel=1
pkgdesc="Third generation of Prudence theme (default in AgiliaLinux) for gtk2, gtk3, metacity, xfwm, openbox and gnome-shell."
arch=('any')
url="http://gnome-look.org/content/show.php/Sammy?content=146116"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-unico>=1.0.1')
source=("http://dl.dropbox.com/u/933063/gnome-look/sammy-${pkgver}.zip")
md5sums=('d5eb6e72a758e5ed741e5b7e6bd6b595')

package() {
  find Sammy*/ -not -name *~ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}

