# Maintainer: Baobab <eternal.baobab@gmail.com>

pkgname=ddconsole-svn
pkgver=1303
pkgrel=1
pkgdesc="Console client for DownloadDaemon"
arch=('i686' 'x86_64')
url="http://downloaddaemon.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'glibc')
conflicts=('ddconsole')
makedepends=('subversion' 'cmake')

build() {
    cd $startdir/src
    mkdir -p ~/.subversion
    svn co https://downloaddaemon.svn.sourceforge.net/svnroot/downloaddaemon/trunk dd
    cd "$srcdir/dd/src/ddconsole"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
	cd "$srcdir/dd/src/ddconsole"
	make DESTDIR=${pkgdir} install
}
