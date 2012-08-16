# Contributor: david "mutterschiff" becker <david dot becker at gmx dot org>

pkgname=xcursor-vienna3
pkgver=1.0
pkgrel=1
pkgdesc="J. Aroche's Vienna3 for CursorXP, converted to an X11 cursor"
arch=('any')
url="http://gnome-look.org/content/show.php/Vienna+3?content=83194"
license=('GPL')
source=("http://www.deviantart.com/download/88493695/J_Aroche__s_Vienna3_Converted_by_s0ury.zip")
md5sums=('ce2d3177a233d31e0a54c4987fd1d654')

package() {
	cd "$srcdir"
	tar -xf Vienna3.tar.gz
	mkdir -p "$startdir/pkg/usr/share/icons/Vienna3"
	cp -R "$srcdir/Vienna3"/{cursors,index.theme} "$startdir/pkg/usr/share/icons/Vienna3"
}
