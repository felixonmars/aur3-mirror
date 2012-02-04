# Maintainer: Max Roder <maxroder AT web DOT de>

pkgname='tpb-svn'
pkgver=319
pkgrel=1
pkgdesc='Access the special buttons on a ThinkPad-Laptop using xosd - SVN Version'
arch=('i686' 'x86_64')
url='http://savannah.nongnu.org/projects/tpb/'
license=('GPL')
depends=('xosd' 'glibc')
makedepends=('subversion')
backup=('etc/tpbrc')
provides=('tpb')
conflicts=('tpb')

_svntrunk='svn://svn.savannah.nongnu.org/tpb/trunk'
_svnmod='tpb'

build() {
	cd ${srcdir}

	msg "Connecting to SVN server...."

	if [ -d ${_svnmod}/.svn ]; then
		(cd ${_svnmod} && svn up -r $pkgver)
	else
		svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting build..."

	# Remove old source files first, if present
	rm -rf ${_svnmod}-build
	svn export ${_svnmod} ${_svnmod}-build
	cd ${_svnmod}-build

	# Compile
	./configure --prefix=/usr --sysconfdir=/etc mandir=/usr/share/man || return 1
	make || return 1
}

package() {
	#Remove .svn directories
	rm -rf `find "$pkgdir" -type d -name ".svn"`

	cd "${srcdir}/${_svnmod}-build"
	make DESTDIR=$pkgdir install || return 1
}
