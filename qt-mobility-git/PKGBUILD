# $Id$
# Contributor: friesoft <friesoft@gmail.com>
# This package provides the qt-mobility api

pkgname=qt-mobility-git
pkgver=20100814
pkgrel=1
pkgdesc="It is a project within Nokia that is creating a new suite of Qt APIs for mobile device functionality. These APIs will enable cross-platform mobile application development."
arch=('i686' 'x86_64')
url="http://qt.nokia.com"
license=('LGPL')
groups=()
depends=('qt>=4.7' 'perl' 'bluez')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

_gitroot="git://gitorious.org/qt-mobility/qt-mobility.git"
_gitname="qt-mobility"

build() {
          msg "Connecting to git server...."

          if [ -d ${srcdir}/$_gitname ] ; then
                    cd $_gitname
                    git reset --hard HEAD
                    git pull origin 

                    msg "The local files have been updated to the current revision"

                    cd $srcdir/$_gitname
          else
                    git clone $_gitroot

                    cd $srcdir/$_gitname
          fi

          ./configure -prefix /usr \
              -plugindir /usr/lib/qt/plugins \
              -examples \
              -demos \
              -silent 
             #-maemo5 \
             #-maemo6 \

          make
}

package() {
          cd $srcdir/$_gitname

#          install -d ${pkgdir}/usr/imports/QtMobility

          make INSTALL_ROOT=$pkgdir install
}
