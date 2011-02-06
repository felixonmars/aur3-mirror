# Contributor: Kosenko Roman <madkite@gmail.com>
pkgname=xsel-svn
pkgver=281
pkgrel=1
pkgdesc='A command-line program for getting and setting the contents of the X selection'
arch=('i686' 'x86_64')
url='http://www.vergenet.net/~conrad/software/xsel/'
license=('MIT')
depends=(libxext libsm)
provides=('xsel')
conflicts=('xsel')
source=(configure.ac.patch)

_svntrunk=http://svn.kfish.org/xsel/trunk/
_svnmod=xsel

build() {
	cd ${srcdir}

	msg "Connecting to $_svntrunk ..."
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver) || return $?
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return $?
	fi
	msg "SVN checkout done or server timeout"

	if [ -d ${_svnmod}-build ]; then
		msg "Deleting old build directory"
		rm -rf ${_svnmod}-build
	fi

	msg "Setting up build environment..."
	cp -r ${_svnmod} ${_svnmod}-build || return $?
	cd ${_svnmod}-build || return $?
	patch -p0 -i ../configure.ac.patch || true

	msg "Starting build"
	aclocal && libtoolize --automake && autoheader && automake --add-missing && autoconf || return $?
	./configure --prefix=/usr || return $?
	make || return $?
	make DESTDIR=${pkgdir} install || return $?
}

md5sums=('050b4f9c98b47025b6d0173465e7e567')
