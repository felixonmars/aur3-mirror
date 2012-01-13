pkgname=xcursor-blackstyle
pkgver=1.1
pkgrel=1
pkgdesc="BlackStyle cursor theme."
arch=('any')
url="http://xfce-look.org/content/show.php/BlackStyle?content=106688"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/106688-BlackStyle.tar.gz")
md5sums=('4df5c0d6aa371b3d92dacab0b24f9ba8')

build() {
	mkdir -p $pkgdir/usr/share/icons
	mv $srcdir/BlackStyle $pkgdir/usr/share/icons/
}
