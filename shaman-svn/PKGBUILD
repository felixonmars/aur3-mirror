# Contributor: Elyess Zouaghi (elyess.tds@gmail.com)

pkgname=shaman-svn
pkgver=1175637
pkgrel=1
pkgdesc="Shaman SVN"
url="http://shaman.iskrembilen.com/"
license="GPL"
arch=('i686' 'x86_64')
depends=('kdelibs' 'aqpm-git')
makedepends=('subversion' 'cmake' 'aqpm-git')
provides=('shaman')
source=()
md5sums=()

_svnmod="shaman"
_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/sysadmin/shaman/"

build() {
    cd $startdir/src

    msg "Connecting to the SVN server...."
    svn co $_svntrunk $_svnmod

    [ -d ./$_svnmod-build ] && rm -fr ./$_svnmod-build
    cp -r ./$_svnmod ./$_svnmod-build
    cd ./$_svnmod-build

    msg "SVN checkout done or server timeout"
    msg "Starting cmake..."

    cmake . -DCMAKE_INSTALL_PREFIX=/usr || return 1

    msg "Starting make..."

    make || return 1
    
    msg "Make successful, installing..."
    
    make DESTDIR=${pkgdir} install || return 1
    
    # remove nasty files
    find $startdir/pkg/ -name ".svn" -type d -exec rm -fr {} +
}
