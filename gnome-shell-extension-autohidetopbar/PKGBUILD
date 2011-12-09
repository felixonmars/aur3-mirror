# Maintainer: dongfengweixiao <dongfengweixiao@gmail.com>
pkgname=gnome-shell-extension-autohidetopbar
pkgver=2.0
pkgrel=1
pkgdesc="Auto hide the top panel "
arch=('i686' 'x86_64')
url="https://extensions.gnome.org/extension/42/auto-hide-top-panel/"
license=('GPL' 'LGPL')
depends=('gnome-shell')
makedepends=('gnome-common' 'intltool')
source=('http://www.fpmurphy.com/gnome-shell-extensions/autohidetopbar-2.0.tar.gz')
md5sums=('2007eff3d4fc61847191be9fa7955124')
package() {
	cd ${srcdir}/
	mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions
	cp -rf autohidetopbar@fpmurphy.com ${pkgdir}/usr/share/gnome-shell/extensions
	rm ${pkgdir}/usr/share/gnome-shell/extensions/autohidetopbar@fpmurphy.com/README
}

