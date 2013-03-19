# Maintainer: bananagranola <rainermoerlinghartheim at yahoo dot com>
pkgname=blackwhite-gtk-theme
pkgver=1
pkgrel=1
pkgdesc="Flat, simple BlackWhite GTK2/GTK3/Openbox theme"
url="http://gnome-look.org/content/show.php/?content=153054"
license=('GPL')
arch=('any')
source=("http://www.deviantart.com/download/318099257/blackwhite_gtk3_by_thrynk-d59dyyh.zip" )
md5sums=('583da41af7f316e15c97fe724c720d3d')

package() {
	mkdir -p "$pkgdir/usr/share/themes"
	cp -dpr --no-preserve=ownership "$srcdir/BlackWhite/BlackWhite/" "$pkgdir/usr/share/themes/"

	find "$pkgdir" -type d -exec chmod 755 "{}" \;
	find "$pkgdir" -type f -exec chmod 644 "{}" \;
}
