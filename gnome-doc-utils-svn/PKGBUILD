# $Id: PKGBUILD 2009-01-01 20:18:26
# Contributor: Carbon <carbonjiao@gmail.com>

pkgname=gnome-doc-utils-svn
pkgver=1136
pkgrel=1
pkgdesc="Documentation utilities for Gnome."
arch=('i686' 'x86_64')
url="http://svn.gnome.org/viewvc/gnome-doc-utils/"
license=('GPL2')
provides=('gnome-doc-utils')
conflicts=('gnome-doc-utils')
depends=('libxslt>=1.1.24' 'python>=2.6' 'docbook-xml' 'docbook-xsl' 'gnome-common-svn' 'rarian>=0.8.1')
makedepends=('autoconf' 'automake' 'libtool' 'gettext' 'intltool' 'gtk-doc' 'pkgconfig' 'm4' 'perlxml' 'subversion')

source=()
md5sums=()

_svntrunk=http://svn.gnome.org/svn/gnome-doc-utils/trunk
_svnmod=gnome-doc-utils

build() {
	cd ${startdir}/src
	# Source
	msg "SVN checkout..."
	svn co $_svntrunk --config-dir ./ $_svnmod/
	msg "SVN checkout done or the server timed out"
	msg "Starting make..."
	mkdir $_svnmod/build
	cd $_svnmod/build
	chmod +x ../autogen.sh
	../autogen.sh --prefix=/usr --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man \
              --localstatedir=/var --disable-scrollkeeper
	make || return 1
	make DESTDIR="${pkgdir}" install
	rm -rf build
}
