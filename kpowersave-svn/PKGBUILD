# Contributer: Dawid Wrobel <cromo@klej.net>

pkgname=kpowersave-svn
pkgver=2951
pkgrel=1
pkgdesc="A KDE-frontend for the power management"
arch=(i686)
url="http://sourceforge.net/projects/powersave"
license="GPL"
depends=('kdelibs' 'kdebase' 'dbus-qt3' 'dbus' 'hal>=0.5.8.1') 
makedepends=('subversion' 'pkgconfig')
conflicts=('kpowersave' 'kpowersave-devel')
provides=('kpowersave')
install=kpowersave.install

source=()
md5sums=()

_svntrunk=https://forgesvn1.novell.com/svn/powersave/trunk/kpowersave
_svnmod=kpowersave

build() {
    cd $startdir/src

    if [ -d $_svnmod/.svn ]; then
	(cd $_svnmod && svn up -r $pkgver)
    else
	svn co $_svntrunk --config-dir ./  $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."
    
    cd $_svnmod

    make -f admin/Makefile.common cvs
    ./configure --prefix=/opt/kde 
    make || return 1
    make DESTDIR=$startdir/pkg install
}
