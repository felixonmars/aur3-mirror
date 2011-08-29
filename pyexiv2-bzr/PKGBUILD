# Contributor: János Illés <ijanos@gmail.com>
# Contributor: Archie <xMickael@ifrance.com>
# Contributor: Byron Clark <byron@theclarkfamily.name>

pkgname=pyexiv2-bzr
pkgver=367
pkgrel=1
pkgdesc="a python binding to exiv2"
depends=('python2' 'boost-libs' 'exiv2')
makedepends=('scons' 'boost' 'bzr')
arch=('i686' 'x86_64')
conflicts=('pyexiv2')
provides=('pyexiv2')
license=('GPL')
source=()
url="http://tilloy.net/dev/pyexiv2"

_bzrbranch=lp:pyexiv2
_bzrname=pyexiv2

build() {
    cd ${srcdir}
    msg "Connecting to BZR server..."

    if [ -d ${srcdir}/${_bzrname} ] ; then
      cd ${_bzrname} && bzr pull ${_bzrbranch}
      msg "Local repository updated."
    else
      bzr co ${_bzrbranch}
    fi
    #bzr branch ${_bzrbranch} -q -r ${pkgver}
    cd ${startdir}

    msg "BZR checkout done or server timeout"
	cd $srcdir/$_bzrname
	scons
	scons DESTDIR=$pkgdir install
}
