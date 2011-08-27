# Contributor: Tim Besard <tim.besard@gmail.com>
pkgname=libbrisa-svn
pkgver=2176
pkgrel=1
pkgdesc="BRisa is a project focused on the development of UPnP technologies. It provides an API to building UPnP devices, services and control points."
arch=('i686' , 'x86_64')
url="http://brisa.garage.maemo.org/"
license=('LGPL')
depends=('qt' 'libqxt')
provides=('libbrisa')
conflicts=('libbrisa')

_svntrunk=https://vcs.maemo.org/svn/brisa/qt/trunk/qt-brisa/
_svnmod=qt-brisa

noextract=()
build() {
    cd ${srcdir}

    msg "Connecting to SVN server...."
    if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r $pkgver)
    else
    svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
    fi
    msg "SVN checkout done or server timeout"
    
    msg "Starting make..."
    svn export ${_svnmod} ${_svnmod}-build
    cd ${_svnmod}-build
	./configure -prefix /usr
	make || return 1
	make INSTALL_ROOT=$startdir/pkg install || return 1
	
	rm -rf ${srcdir}/${_svnmod}-build
}

