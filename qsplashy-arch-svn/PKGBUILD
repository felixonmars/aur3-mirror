# QSplashy-Arch Subversion Package
# Contributor: Dario Freddi (drf54321@gmail.com)

pkgname=qsplashy-arch-svn
pkgver=728
pkgrel=1
pkgdesc="A Qt4 Splashy frontend tweaked for Arch Linux"
url="http://kdemod.ath.cx"
license="GPL"
arch=('i686' 'x86_64')
depends=('qt>=4.3.0' 'splashy')
makedepends=('subversion' 'cmake')
provides=('qsplashy')
conflicts=('qsplashy' 'qsplashy-arch')
source=()
md5sums=()

_svnmod="qsplashy-arch"
_svntrunk="http://kdemod.ath.cx/svn/tools/qsplashy-arch/"

build() {
    cd $startdir/src
    #mkdir -p ~/.subversion; touch ~/.subversion/servers
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
    
    make DESTDIR=$startdir/pkg install || return 1
    
    # remove nasty files
    find $startdir/pkg/ -name ".svn" -type d -exec rm -fr {} +
}
