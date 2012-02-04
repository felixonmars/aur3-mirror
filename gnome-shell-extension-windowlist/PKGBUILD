# Contributor: Flamelab <panosfilip@gmail.com>

pkgname=gnome-shell-extension-windowlist
pkgver=0.1
pkgdesc="A Gnome Shell extension that tries to transform the Application Menu to a window list."
pkgrel=1
arch=(any)
url="http://www.o2net.cl/gnome/windowlist.html"
license=(GPL2)
makedepends=(gnome-shell intltool)
source=(http://www.o2net.cl/gnome/windowlist-0.1.tar.gz)
install=gnome-shell-extension-windowlist.install



package() {
	
  mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions/
 
  cp -r ${srcdir}/windowlist@o2net.cl ${pkgdir}/usr/share/gnome-shell/extensions/
}

md5sums=('ad3ba18f76307498f3345199b340256d')
