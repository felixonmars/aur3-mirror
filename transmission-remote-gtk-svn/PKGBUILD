# Maintainer: Aleksey Frolov <atommixz@gmail.com> [ru]
# Contributor: PitBall

_pname=transmission-remote-gtk
pkgname=${_pname}-svn
pkgver=403
pkgrel=1
pkgdesc="GTK client for remote management of the Transmission BitTorrent client, using its HTTP RPC protocol"
arch=(i686 x86_64)
license=('GPL2')
depends=('hicolor-icon-theme' 'geoip' 'libproxy' 'libunique' 'json-glib' 'libnotify' 'gconf' 'desktop-file-utils' 'curl')
makedepends=('intltool')
conflicts=('transmission-remote-gtk')
install=${pkgname}.install
options=('!libtool')
url="http://code.google.com/p/transmission-remote-gtk"

_svntrunk="http://transmission-remote-gtk.googlecode.com/svn/trunk"
_svnmod=${pkgname}

build() {
	cd ${srcdir}

# SVN checkout
	if [[ -d ${_svnmod}/.svn ]]; then
		(cd ${_svnmod} && svn up -r $pkgver)
	else
		svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
	fi

	rm -rf ${srcdir}/${_svnmod}-build
	cp -r ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
	cd ${srcdir}/${_svnmod}-build

# Configure
	./autogen.sh
	./configure \
	--prefix=/usr
#		--prefix=/usr \
#		--disable-schemas-install \
#		--with-gconf-schema-file-dir=/usr/share/gconf/schemas

# Compile
	make

# Install
	make DESTDIR=${pkgdir} install

# License & Authors
	install -dm755 ${pkgdir}/usr/share/licenses/${_pname}
	ln -sf /usr/share/licenses/common/GPL2/license.txt ${pkgdir}/usr/share/licenses/${_pname}/LICENSE
	install -Dm644 AUTHORS ${pkgdir}/usr/share/doc/${_pname}/AUTHORS
}
