# Maintainer: Ner0

pkgname=gtk-theme-ambiance-grey
pkgver=0.7.1
pkgrel=1
pkgdesc="Ambiance Grey theme for Ubuntu 14.04"
arch=('any')
url="http://gnome-look.org/content/show.php/Ambiance+Grey+for+Ubuntu+14.04?content=16474"
license=('GPL3')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
options=('!strip')
source=("http://gnome-look.org/CONTENT/content-files/164745-Ambiance-Grey.tar.gz")
sha256sums=('1d22200ed2a70bba4b5a5fa1a630609461f6128e4c74ef06be56692bbbdca1d5')

package() {
  cd "$srcdir/Ambiance-Grey/"
  install -dm755 "$pkgdir/usr/share/themes/AmbianceGrey"
  cp -rt "$pkgdir/usr/share/themes/AmbianceGrey/" *
  find "$pkgdir/" -type d -exec chmod 755 "{}" \+
  find "$pkgdir/" -type f -exec chmod 644 "{}" \+
}

# vim: set ts=2 sw=2 et:
