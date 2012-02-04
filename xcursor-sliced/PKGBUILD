pkgname=xcursor-sliced
pkgver=20091104
pkgrel=1
pkgdesc="Sliced cursor theme."
arch=('any')
url="http://xfce-look.org/content/show.php/Sliced?content=104872"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/104872-Sliced.tar.gz")
md5sums=('302d48d352ef1b06e5580453019867aa')

build() {
	mkdir -p $pkgdir/usr/share/icons
	mv $srcdir/Sliced $pkgdir/usr/share/icons/
}
