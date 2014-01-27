# Contributor: apollokk <karanti@ontelecoms.gr>
# Maintainer: Ben R <thebenj88 *AT* gmail *DOT* com>

pkgname=tragedy-plasmatheme
pkgver=2.0.1
pkgrel=1
pkgdesc="A new plasma theme, for dark backgrounds"
arch=('any')
license=('GPLv3')
url="http://www.kde-look.org/content/show.php/Tragedy?content=101707"
depends=('kdelibs' 'kdebase-workspace')
source=(http://kde-look.org/CONTENT/content-files/101707-tragedy.tar.gz)
sha1sums=('d81d336475563a53040f9735514f5b11a16719f1')

package()
{
	mkdir -p $pkgdir/usr/share/apps/desktoptheme
	cd $srcdir
	cp -R tragedy $pkgdir/usr/share/apps/desktoptheme
}