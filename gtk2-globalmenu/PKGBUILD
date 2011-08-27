# Contributor: Prashant Vaibhav <mercurysquad@googlemail.com>
# Updated by Megamixman 
pkgname=gtk2-globalmenu
pkgver=0.4.1020.2.12.11
_pkgver=2.12.11
pkgrel=1
pkgdesc="The GTK+ Toolkit (v2), with Mac-style global menubar support and associated applet"
arch=(i686)
url="http://code.google.com/p/gnome2-globalmenu/"
install=gtk2.install
depends=('atk>=1.22.0' 'pango>=1.20.5' 'libxcursor' 'libxinerama' 'libxrandr>=1.2.1' 'libxi' 'libcups>=1.3.8-2' 'libxcomposite' 'libxdamage' 'heimdal>=1.2' 'gnutls>=2.4.1')
makedepends=('pkgconfig' 'subversion' 'gnome-common' 'gnome-doc-utils' 'intltool' 'gtk-doc')
provides=('gtk2=2.12.11')
replaces=('gtk2-aqd')
conflicts=('gtk2')
options=(!libtool)
backup=(etc/gtk-2.0/gtkrc)
license=('LGPL')
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/2.12/gtk+-${_pkgver}.tar.bz2
	gtkclipboard-check.patch)
md5sums=('f7aab88e856a813386f797aade5867ad'
         '4025d3c15d6c6f73a032f403ffd4ff1c')
#_svntrunk=http://gnome2-globalmenu.googlecode.com/svn/trunk/
#_svnmod=gnome-globalmenu

build() {
	# first build the applet
	cd ${startdir}/src
	rm -rf gnome-globalmenu
	svn checkout http://gnome2-globalmenu.googlecode.com/svn/trunk/ -r 1020 gnome-globalmenu
	cd gnome-globalmenu

	./autogen.sh
	./configure --prefix=/usr --enable-gtk-doc --enable-xfce-plugin=no --enable-maintainer-mode=no --enable-tracing=no
	make || return 1
	make DESTDIR=${startdir}/pkg/ install

	# now build patched gtk2
	cd gtk+-aqd
	mkdir gtk+-aqd
	cp ${startdir}/src/gtk+-${_pkgver}.tar.bz2 .
	tar --strip-components=1 -xjvf gtk+-${_pkgver}.tar.bz2 -C gtk+-aqd
	make patch
	cd gtk+-aqd
	patch -Np1 -i ${startdir}/src/gtkclipboard-check.patch || return 1

	./configure --prefix=/usr --sysconfdir=/etc \
	--localstatedir=/var --with-xinput=xfree \
	--with-included-loaders=png || return 1
	make || return 1
	make DESTDIR=${startdir}/pkg install || return 1

	mkdir -p ${startdir}/pkg/etc/gtk-2.0
	echo 'gtk-fallback-icon-theme = "gnome"' > ${startdir}/pkg/etc/gtk-2.0/gtkrc
}
