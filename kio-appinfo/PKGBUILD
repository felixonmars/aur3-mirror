#
# Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>
#

pkgname=kio-appinfo
pkgver=0.1
pkgrel=2
pkgdesc="The appinfo:/ KIO slave combines an application's configuration, data, manual and temp files and folders into a single view."
url="http://www.kde-apps.org/content/show.php/KIO+Slave+appinfo%3A%2B?content=72928"
license="GPL"
depends=('kdelibs')
arch=('i686' 'x86_64')

source=(http://www.kde-apps.org/CONTENT/content-files/72928-appinfo.tar.bz2)
md5sums=('bc1e56d817a76992b8096807b71db373')

build() {
	cd $startdir/src/appinfo
	./configure --prefix=/opt/kde 
	make || return 1
	make DESTDIR=$startdir/pkg install
}
