# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com
pkgname=marples-black
pkgver=1.9.5
pkgrel=1
pkgdesc="A dark GTK2/GTK3 theme"
arch=('any')
url="http://gnome-look.org/content/show.php?content=144240"
license=('GPL')
source=(http://ompldr.org/vYW4ybw)
sha256sums=(f598ef46cbd75e738b79c214280355a03936e4c2caca87fab9aa6af203d9ecd8)

build() {
  cd "$srcdir"

  # Get rid of excess files and unnecessary permissions
  find "$pkgname" -name \*\~ -print0 | xargs -0 rm -f
  find "$pkgname" -type d -print0 | xargs -0 chmod 755
  find "$pkgname" -type f -print0 | xargs -0 chmod 644
}

package() {
  cd "$pkgdir"
  mkdir -p usr/share/themes
  mv "$srcdir/$pkgname" usr/share/themes
}
