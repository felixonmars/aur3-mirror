# Maintainer: LaraCraft304 <lara@craft.net.br>
# Contributor: Gordin <9ordin @t gmail.com>

pkgname=qtwitgui-svn
pkgver=232
pkgrel=2
pkgdesc="GUI for Wiimms ISO Tools"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qtwitgui/"
license=('GPL3')
depends=('wit' 'qt4')
provides=('qtwitgui')

source=('fix-lz.patch'
        'qtwitgui::svn+http://qtwitgui.googlecode.com/svn/trunk')
        
md5sums=('ab71e126c5f9d3a466f6197eb55ac257'
         'SKIP')

pkgver() {
	cd "$srcdir"/${pkgname%-*}
	svnversion | tr -d [A-z]
}

prepare() {
	cd "$srcdir"/${pkgname%-*}
	qmake-qt4
	patch -Np0 -i ../fix-lz.patch
}

build() {
	cd "$srcdir"/${pkgname%-*}
	make
}

package() {
	cd "$srcdir"/${pkgname%-*}
	mkdir -p $pkgdir/usr/bin/
	install QtWitGui $pkgdir/usr/bin
}
