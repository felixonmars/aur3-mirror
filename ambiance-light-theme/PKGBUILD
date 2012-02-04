# Maintainer: grimi <grimi at poczta dot fm>

pkgname=ambiance-light-theme
pkgver=1.2
pkgrel=1
pkgdesc="An ambiance theme (gtk2,gtk3,metaicity,xfwm4 and unity), modified to look like the version of natty."
arch=('any')
url="http://gnome-look.org/content/show.php/Ambiance+light?content=147222"
license=('GPL')
depends=('gtk-engine-murrine>=0.98.1.1' 'gtk-engine-unico>=1.0.1')
source=(http://gnome-look.org/CONTENT/content-files/147222-Ambiance%20light.tar.gz)
md5sums=('4acc16c87db16b124c46b1d884d15511')


package() {
  mv Ambiance\ light Ambiance-light
  sed 's|Ambiance|Ambiance-light|g' -i Ambiance-light/index.theme
  find Ambiance-light/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
