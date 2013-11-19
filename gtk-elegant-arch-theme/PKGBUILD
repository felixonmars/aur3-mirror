# Maintainer: Sfincs <fra.tw138@gmail.com>

pkgname=gtk-elegant-arch-theme
pkgver=0.6
pkgrel=3
pkgdesc="An Arch Linux theme for GTK based on Elegant Brit, with colors from the Arch homepage"
arch=('any')
url="http://gnome-look.org/content/show.php?content=136912"
license=('Creative Commons by')
depends=('gtk2')
source=('http://gnome-look.org/CONTENT/content-files/136912-gtk-elegant-arch-theme-0.6.tar.gz')
md5sums=('f37299abd1e9ed3856721eea0c54a5f2')

package() {
  cd "$srcdir"
	tar xf 136912-gtk-elegant-arch-theme-0.6.tar.gz
	mkdir -p "$pkgdir/usr/share/themes"
	cp -r "$srcdir/Elegant Arch" "$pkgdir/usr/share/themes/Elegant Arch"
}
