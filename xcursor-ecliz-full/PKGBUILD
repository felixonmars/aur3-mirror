#Maintainer: Sebastian Wolf <fatmike303 at gmail dot com>

pkgname=xcursor-ecliz-full
_pkgname=Ecliz-Full
pkgver=1.0
pkgrel=1
pkgdesc="Ecliz cursor theme (full size)"
arch=(i686 x86_64)
url="http://www.kde-look.org/content/show.php/?content=76605"
license=('N/A')
depends=()
source=("http://download281.mediafire.com/3zi6wtz2xddg/jbwmycd1rdc/${_pkgname}.tar.bz2")
md5sums=('a9cabeda25ba6b177ef311b5aee2d127')

build() {
	cd $startdir/src/Ecliz_Full
	install -d -m755 $startdir/pkg/usr/share/icons/${_pkgname}/cursors/filesources
	install -D -m644 $startdir/src/Ecliz_Full/index.theme \
					$startdir/pkg/usr/share/icons/${_pkgname}
	cd $startdir/src/Ecliz_Full/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/${_pkgname}/cursors
	done
}

