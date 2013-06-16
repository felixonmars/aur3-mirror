# Maintainer: Sebastian Vandekerckhove <sebastianvdk(at)foxatwork(dot)be>
# Contributor: Ivan Abdulin <elbahek@gmail.com>

pkgname=mysql-proxy-bzr
pkgver=1245
pkgrel=1
pkgdesc="Monitors, analyzes and transformations communication between the MySQL client and server"
arch=('i686' 'x86_64')
url="http://forge.mysql.com/wiki/MySQL_Proxy"
license=('GPL')
depends=('lua>=5.1.0' 'glib2>=2.4.0' 'libevent>=1.0')
makedepends=('libmysqlclient' 'bzr' 'pkgconfig' 'autoconf' 'automake' 'libtool')
provides=('mysql-proxy')
conflicts=('mysql-proxy')

_bzrmod=mysql-proxy
_bzrtrunk=lp:${_bzrmod}

build() {
	msg "Connecting to Bazaar server...."

	if [ -d ${_bzrmod} ]; then
		cd ${_bzrmod} && bzr pull ${_bzrtrunk} -r $pkgver && cd ..
		msg "The local files are updated."
	else
		bzr branch ${_bzrtrunk} ${_bzrmod} -r $pkgver
	fi

	msg "Bazaar checkout done or server timeout"
	msg "Starting build..."

	[ -d ${_bzrmod}-build ] && rm -rf ${_bzrmod}-build
	cp -r ${_bzrmod} ${_bzrmod}-build
	cd ${_bzrmod}-build
	
	# Remove obsolete automake AM_C_PROTOTYPES macro
	sed -i '/^AM_C_PROTOTYPES/d' configure.in
	
	./autogen.sh
	./configure --prefix=/usr --datadir=/usr/share/${pkgname} --with-lua=lua5.1 LDFLAGS="-ldl"
	make
}

package() {
	cd "${srcdir}/${_bzrmod}-build"
	make DESTDIR="${pkgdir}" install
}