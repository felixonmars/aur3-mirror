pkgname=xcursor-relic
pkgver=20111209
pkgrel=1
pkgdesc="Relic (Silver&Gold) cursor theme."
arch=('any')
url="http://gnome-look.org/content/show.php/Relic+%28Silver%26Gold%29?content=119478"
license=('GPL')
depends=()
source=("http://dl.dropbox.com/u/52379817/X11%20Mouse%20Themes/Relic.tar.gz")
md5sums=('ecee2ccc1eb17e3c407a6bb4f592b684')

build() {
	mkdir -p $pkgdir/usr/share/icons
	mv $srcdir/Relic_Gold $pkgdir/usr/share/icons/
	mv $srcdir/Relic_Silver $pkgdir/usr/share/icons/
}
