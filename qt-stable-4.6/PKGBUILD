# $Id$
# Contributor: Casey Link <casey.link@kdab.com>
# This package provides the last stable 4.6.3 package for Qt

pkgname=qt-stable-4.6
pkgver=4.6.3
pkgrel=1
pkgdesc="The C++ Qt GUI framework - stable 4.6.3 release"
arch=('x86_64')
url="http://www.qtsoftware.com"
license=('GPL3' 'LGPL')

depends=('libpng' 'mesa' 'fontconfig' 'libtiff' 'libmng' 'sqlite3' 'libxrandr' 'glib2' 'libxi' 'dbus' 'libxcursor' 'libxinerama' 'libxrender' 'ca-certificates')
optdepends=('postgresql-libs' 'libmysqlclient' 'unixodbc')
options=('!libtool' 'docs')

# desktop files and qdoc3 patch -- needed for qtdesigner-git build

md5sums=('e4edd65b55b8ea085b983eef7412f374')

source=('http://arm.konnichi.com/2010/09/15/extra/os/x86_64/qt-4.6.3-1-x86_64.pkg.tar.xz')

build() {
    cd $srcdir
    msg "Hi"
}

package() {
    cd $srcdir
    rm .INSTALL
    rm .PKGINFO
    if [ -d qt-stable-4.6 ] ; then
        rm -rf qt-stable-4.6
    fi
    if [ -d opt ] ; then
        rm -rf opt/
    fi

    mv usr qt-stable-4.6
    mkdir opt/
    mv qt-stable-4.6 opt/
    mv opt $pkgdir
}

