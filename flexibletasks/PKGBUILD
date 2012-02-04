# Contributor: Martin Lee <hellnest.fuah@gmail.com>

pkgname=flexibletasks
pkgver=0.2
pkgrel=1
pkgdesc="Improved task plasmoid applet for KDE"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Flexible+Tasks?content=129291"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/129291-flexibletasks-$pkgver.tar.gz")

build () {
	cd $srcdir/$pkgname
	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
	make
}

package () {
	cd $srcdir/$pkgname
	make DESTDIR="$pkgdir" install
}
sha256sums=('fcc8f10f755becf9de58ff0d515338964d0ed607e2e7f3826b82f7b80d3ae78e')
