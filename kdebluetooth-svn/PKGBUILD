# $Id$
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=kdebluetooth-svn
pkgver=1087893
pkgrel=1
pkgdesc="A collection of Bluetooth utilities and modules for KDE based on BlueZ"
arch=('i686' 'x86_64')
url="http://bluetooth.kmobiletools.org/"
license=('GPL2')
depends=('kdebase-workspace' 'bluez' 'obex-data-server')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'perl')
optdepends=('python')
provides=('kbluetooth')
conflicts=('kbluetooth')
install=${pkgname}.install
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/network/kbluetooth/
_svnmod=kbluetooth

source=()
md5sums=()

build() {
        cd $startdir/src

        svn co $_svntrunk $_svnmod

        msg "SVN checkout done or server timeout"
        msg "Starting make..."
        cd $_svnmod

        cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
 
        make VERBOSE=1 || return 1
        make DESTDIR=$startdir/pkg install || return 1
}
