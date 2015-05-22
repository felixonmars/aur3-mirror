pkgname=gtk-theme-breezy-gtk3
pkgver=git052015
pkgrel=1
pkgdesc="A GTK+ 3 Theme Built to Match KDE's Breeze."
arch=('any')
url="https://github.com/dirruk1/gnome-breeze"
license=('GPLv2')
depends=()
makedepends=('git')
optdepends=()
provides=('breezy-gtk3')
conflicts=('gtk-theme-breezy')
source=('git+https://github.com/dirruk1/gnome-breeze.git')
md5sums=('SKIP')

package() {

  install -d -m 755 "$pkgdir"/usr/share/themes/gtk-3.0

  cd $srcdir/gnome-breeze/
  cp -r . "$pkgdir"/usr/share/themes/BreezyGTK/
}
