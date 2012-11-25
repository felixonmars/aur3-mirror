# Maintainer: slowpoke <mail+aur at slowpoke dot io>
pkgname=gtk-theme-darkgreen
pkgver=0.2
pkgrel=1
pkgdesc="Another dark type gtk theme."
arch=('any')
url="http://gnome-look.org/content/show.php/DarkGreen?content=31735"
license=('GPL')
source=('http://gnome-look.org/CONTENT/content-files/31735-DarkGreen.tgz')
md5sums=('5567983c794d6bcc98ea8aa47f1a9594')

package() {
  mkdir -p $pkgdir/usr/share/themes
  cp -r $srcdir/DarkGreen $pkgdir/usr/share/themes
}

# vim:set ts=2 sw=2 et:
