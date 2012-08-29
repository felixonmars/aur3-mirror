# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=bridge-gtk2-theme
pkgver=0.2
pkgrel=1
pkgdesc="Adwaita 3.4 port for GTK+ 2 applications"
arch=('any')
url="http://gnome-look.org/content/show.php?content=151057."
license=('LGPL2.1')
depends=('gtk2' 'gtk3<3.5')
source=(http://gnome-look.org/CONTENT/content-files/151057-Bridge0.2.zip)
sha256sums=('1bf7cd9de3d6948a2dfdd95d5966d58ed88f744cef4535101cf40fd26cd7f798')

build() {
  cd "$srcdir/Bridge"
  find . -type d -print0 | xargs -0 chmod 755
  find . -type f -print0 | xargs -0 chmod 644
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/themes"
  cp -a Bridge "$pkgdir/usr/share/themes"
}
