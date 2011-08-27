# Contributor: Michael Klier <chi@chimeric.de>
# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=upslug2
pkgver=41
pkgrel=3
pkgdesc="A tool to flash your NSLU2 (Slug) from a computer on a local network."
url="http://www.nslu2-linux.org/wiki/Main/UpSlug2"
depends=('gcc-libs')
makedepends=('subversion')
arch=('i686' 'x86_64')
license=('custom')
source=()
md5sums=()

_svntrunk="http://svn.nslu2-linux.org/svnroot/upslug2/trunk"
_svnmod="upslug2"

build() {
	cd ${srcdir}

	msg "Connecting to ${_svnmod}.nslu2-linux.org SVN server...."
	if [ -d ${_svnmod}/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cp -r $_svnmod ${_svnmod}-build
	cd ${_svnmod}-build

	autoreconf -i
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${pkgdir} install || return 1

	install -d ${pkgdir}/usr/share/man/man8/
	gzip -c ${pkgname}.8 > ${pkgdir}/usr/share/man/man8/${pkgname}.8.gz || return 1
	install -d ${pkgdir}/usr/share/licenses/${pkgname}
	cp COPYING ${pkgdir}/usr/share/licenses/${pkgname}

	rm -rf ${srcdir}/${_svnmod}-build
}
