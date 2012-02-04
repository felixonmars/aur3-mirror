
pkgname="orocos-kdl-svn"
pkgver=32863
pkgrel=1
pkgdesc="The Kinematics and Dynamics Library is a framework for modelling and computation of kinematic chains. SVN version, with python bindings enabled and working."
arch=('i686' 'x86_64')
url="http://www.orocos.org/kdl"
license=('GPL')
depends=("eigen" "orocos-rtt" "python" "sip")
makedepends=("gcc" "cmake" "subversion")
provides=("orocos-kdl")

_svntrunk="http://svn.mech.kuleuven.be/repos/orocos/trunk/kdl/"
_svnmod="kdl"

build() {
	cd ${srcdir}
	msg "Connecting to svn server..."
	if [ -d ${_svnmod}/.svn ]; then
	  (cd ${_svnmod} && svn up)
	else
	  svn co ${_svntrunk} ${_svnmod}
	fi

	msg "SVN checkout done or server timeout"
  	msg "Creating make environment..."

	if [ -d ${srcdir}/${_svnmod}/build ]; then
	  rm -rf ${srcdir}/${_svnmod}/build/*
	else
  	  mkdir ${srcdir}/${_svnmod}/build
	fi
  	cd ${srcdir}/${_svnmod}/build

	msg "Starting make..."

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_BINDINGS=1 ..
	make || return 1
}

package() {
	cd ${srcdir}/${_svnmod}/build

	make DESTDIR=${pkgdir} install || return 1
}

