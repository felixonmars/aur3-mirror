
pkgname=kmenu-gnome
pkgver=1.2.2
pkgrel=1
license=('GPL' 'LGPL')
pkgdesc="K Menu with Gnome folder and extra icons for KDE 3.2 or later."
url='http://www.kde-apps.org/content/show.php?content=31025'

arch=('i686' 'x86_64')

source=(http://www.kde-apps.org/CONTENT/content-files/31025-${pkgname}-${pkgver}.tar.gz)
md5sums=('db1326abf55247b8a64369e5aab273cb')
options=('!libtool')

build() {
	  cd ${startdir}/src/${pkgname}-${pkgver}
	  mkdir -p ${startdir}/pkg/etc/xdg/menus/kde-applications-merged
	  mkdir -p ${startdir}/pkg/usr/share
	  cp -a xdg/kmenu-gnome.menu \
	  ${startdir}/pkg/etc/xdg/menus/kde-applications-merged
	  cp -a desktop-directories icons ${startdir}/pkg/usr/share
	  cp -a ${pkgname} ${startdir}/pkg/usr/share
}
