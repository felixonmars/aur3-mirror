# Contributor: Shawn Dellysse <sdellysse@radford.edu>

pkgname=clearlooks-bluecurve-gtk-theme
pkgver=0.5.2
pkgrel=1
pkgdesc="A GTK theme that uses the actual, official Bluecurve colors"
arch=('i686' 'x86_64')
depends=('gtk-engines')
optdepends=('redhat-artwork: for the bluecurve icons')
url="http://www.gnome-look.org/content/show.php?content=22577"
license=('GPL')
source=(http://www.gnome-look.org/CONTENT/content-files/22577-Clearlooks-Bluecurve.tar.gz)
md5sums=('cddd4920907c1e84509354ae919b61ce')

build() {
	install -d -m755 $pkgdir/usr/share/themes
	cp -r $srcdir/Clearlooks-Bluecurve $pkgdir/usr/share/themes
}
