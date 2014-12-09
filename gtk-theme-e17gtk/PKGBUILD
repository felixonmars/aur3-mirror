# Maintainer: Rob McCathie <archaur at rmcc dot com dot au>

pkgname=gtk-theme-e17gtk
pkgver=20141022
pkgrel=1
pkgdesc="A dark Gtk theme with sharp corners, which is designed for use in Enlightenment and gives the elegant look of Enlightenment to Gtk3, Gtk2 and Qt widgets"
arch=('any')
url="http://gnome-look.org/content/show.php/E17gtk?content=163472"
license=('GPL')
source=("http://gnome-look.org/CONTENT/content-files/163472-E17gtk-20141022.tar.xz")
sha1sums=('a4dc888aaade315bd30f8b8c81cb09354d903796')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}/E17gtk" "${pkgdir}/usr/share/themes"
}
