# Maintainer: Fernando Manfredi <blackice at craft.net.br>

pkgname=xcursor-oxygene
pkgver=0.2
pkgrel=1
pkgdesc="+OxygenE X11 Mouse Theme"
arch=('any')
url="http://gnome-look.org/content/show.php/%2BOxygenE?content=159354"
license=('LGPL')
depends=()
source=("http://gnome-look.org/CONTENT/content-files/159354-+OxygenE.tar.gz")
md5sums=('bb67a241d1f9bad29c85353e56c598d4')

package() {
	mkdir -p "$pkgdir/usr/share/icons"
	cp -r "$srcdir/+OxygenE" "$pkgdir/usr/share/icons"

}

