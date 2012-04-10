# Maintainer: Proxypoke (slowpoke) < proxypoke at lavabit dot com >

pkgname=gtk-theme-terminus-colors
pkgver=1.8
pkgrel=1
pkgdesc="A GTK theme with a terminal look, using ncmpcpp colors."
arch=('any')
url="http://gnome-look.org/content/show.php/terminus-colors?content=109028"
license=('GPL')
source=(http://gnome-look.org/CONTENT/content-files/109028-terminus-colors.tar.gz)
md5sums=('372fc4fbcf993760899ebd1c3bce1789')

package() {
  mkdir -p $pkgdir/usr/share/themes
  cp -r $srcdir/terminus-colors $pkgdir/usr/share/themes
}

# vim:set ts=2 sw=2 et:
