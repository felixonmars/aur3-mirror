pkgname=xcursor-azenis
pkgver=20091125
pkgrel=1
pkgdesc="Azenis cursor theme."
arch=('any')
url="http://xfce-look.org/content/show.php/Azenis?content=104666"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/104666-Azenis.tar.gz")
md5sums=('00d8a1b039e97e72e740c6cdd29df898')

build() {
	mkdir -p $pkgdir/usr/share/icons
	mv $srcdir/Azenis $pkgdir/usr/share/icons/
}
