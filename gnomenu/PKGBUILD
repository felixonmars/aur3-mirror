# Maintainer: chris_L <chrislcenter dash mamoru at yahoo.com dot mx>
# Contributor: Miguel Useche <migueluseche@skatox.com>
# Contributor: Pat <whaevr@archlinux.us>
pkgname=gnomenu
pkgver=2.9.1
pkgrel=5
pkgdesc="A consolidated menu for gnome2,awn,cairo-dock,docky,etc that brings eye candy to the world of the Gnome menu's."
arch=(any)
url="https://launchpad.net/gnomenu"
license=('GPL3')
depends=('python2' 'python2-xdg' 'python2-cairo' 'python2-lxml' 'pygtk')
optdepends=('python2-xlib' 'python2-numpy' 'gettext')
makedepends=('python2-distribute')
source=("http://launchpad.net/gnomenu/trunk/${pkgver}/+download/gnomenu-${pkgver}.tar.gz"
		patch_menu_parser_py.patch
		patch_menu_items_py.patch)
md5sums=('f8b3cd0c342f5e01be32acfbc335b8be'
         'f12f1baf8887be323f635e47302aed39'
         '43e656e04b46fbbe67f66a373f5446f7')

build() {
	cd ${srcdir}/$pkgname
	sed -i "s|python|python2|" Makefile
}

package() {
	export PYTHON=/usr/bin/python2
	cd ${srcdir}/$pkgname
	mkdir -p $pkgdir/usr/share/dockmanager/scripts
	make DESTDIR=${pkgdir} install || return 1
	
	cd $pkgdir
	sed -i -e "s|#!/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" $(find ./ -name '*.py')
	sed -i "s|python\ -u|python2\ -u |g" usr/bin/GnoMenu.py
	patch -p1 < $srcdir/patch_menu_parser_py.patch
	patch -p1 < $srcdir/patch_menu_items_py.patch
}
