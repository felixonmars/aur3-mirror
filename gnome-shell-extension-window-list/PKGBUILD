# Author: KurtRottmann <kurtrottmann at gmail dot com>
# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=gnome-shell-extension-window-list
pkgver=0.1
pkgrel=1
pkgdesc="This Gnome Shell extension tries to transform the Application Menu to a window list."
arch=('any')
url="http://www.o2net.cl/gnome/windowlist.html"
license=('GPL')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.o2net.cl/gnome/windowlist-${pkgver}.tar.gz")
md5sums=('ad3ba18f76307498f3345199b340256d')

package() {
    mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions
    tar xf windowlist-${pkgver}.tar.gz -C ${pkgdir}/usr/share/gnome-shell/extensions
}
