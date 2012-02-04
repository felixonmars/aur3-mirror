#Maintainer: ZDragon <pyryara at gmail dot com>

pkgname=kdeplasma-addons-applet-plasmafeed
pkgver=1.01
pkgrel=2
pkgdesc='Plasma Feed is a simple plasmoid for displaying new RSS and Atom feed items in a small list on your desktop or in systray.'
arch=('i686' 'x86_64')
url='http://kde-apps.org/content/show.php/Plasma+Feed?content=118140'
license=('GPL')
depends=('kdebase-workspace')
makedepends=('qt' 'cmake' 'automoc4' 'unzip')
install=plasmafeed.install
source=("http://kde-apps.org/CONTENT/content-files/118140-plasma-feed.zip")
md5sums=('ae52bd56fb135fdcb944fa34772db3a2')

build () {
	cd $srcdir
	cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}
