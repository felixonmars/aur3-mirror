pkgname=gtk-theme-breezy
pkgver=git052815
pkgrel=1
pkgdesc="A GTK theme created to match with the new Plasma 5' Breeze."
arch=('any')
url="https://github.com/dirruk1/gnome-breeze"
license=('GPLv2')
optdepends=("gtk2: GTK+2 theme" "gtk3: GTK+3 theme")
makedepends=('git')
conflicts=('gtk-theme-breezy-gtk3' 'gtk-theme-breezy-gtk2')
source=('git+https://github.com/dirruk1/gnome-breeze.git')
md5sums=('SKIP')

package() {

  install -d -m 755 "$pkgdir"/usr/share/themes/

  cd $srcdir/gnome-breeze/
  rm LICENSE
  rm README.md
  cp -r . "$pkgdir"/usr/share/themes/
}
