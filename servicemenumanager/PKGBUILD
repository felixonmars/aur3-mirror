# Contributor: Christopher Schwaab -- christopher.schwaab gmail
pkgname=servicemenumanager
pkgver=0.4
pkgrel=1
pkgdesc="KDE System Settings Module for managing and downloading service menus."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Service+Menu+Manager?content=94996"
license=('GPL')
depends=('kdelibs')
source=("http://linux.wuertz.org/dists/sid/main/source/kcm-servicemenus_$pkgver.tar.gz")
md5sums=('d7fe4aa352c856c8f272c5b4c7330419')

build()
{
	cd "kcm-servicemenu"
	cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}
