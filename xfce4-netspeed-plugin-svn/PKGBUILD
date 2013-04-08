# Maintainer: Lara Maia <lara@craft.net.br>
pkgname=xfce4-netspeed-plugin-svn
_pkgbase=xfce4-netspeed-plugin
pkgdesc="Netspeed plugin for xfce4 panel. Like gnome netspeed applet"
pkgver=0.3
pkgrel=2
arch=('i686' 'x86_64')
url="http://code.google.com/p/xfce4-netspeed-plugin/"
license=('GPL')
depends=('xfce4-panel' 'libgtop')
makedepends=('xfce4-dev-tools' 'subversion' 'intltool')
provides=('xfce4-netspeed-plugin')
install='xfce4-netspeed-plugin.install'
source=("$_pkgbase::svn+http://xfce4-netspeed-plugin.googlecode.com/svn/trunk/"
        'xfce4-netspeed-plugin.install')
md5sums=('SKIP'
         'b2ebab59089be208323356fef393640a')

pkgver() {
	cd "$SRCDEST/$_pkgbase"
	
	echo $pkgver.r$(svnversion | tr -d [A-z])
}

prepare() {
	cd "$srcdir/$_pkgbase"
	sed 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' -i configure.ac.in
}

build() {
	cd "$srcdir/$_pkgbase"
	
	chmod +x autogen.sh
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgbase"
	
	make DESTDIR="$pkgdir" install
}
