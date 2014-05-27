# Maintainer: Eivind Eide <xenofil A-T gmail D-O-T com>
# Contributor: Marco Tangaro <marco_tangaro@hotmail.com>

pkgname=qbat-git
pkgver=20100207
pkgrel=2
pkgdesc="A small tool based on Qt4 to display battery stats in system tray"
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/qbat.git"
license=('GPL2')
depends=('qt4')
makedepends=('git' 'cmake')
source=()
md5sums=()

_gitroot="git://repo.or.cz/qbat.git"
_gitname="qbat"

build() {
cd "$srcdir"
msg "Connecting to GIT server...."

if [ -d $srcdir/$_gitname ] ; then
(cd $_gitname && git pull origin)
msg "The local files are updated."
else
git clone $_gitroot
fi

msg "GIT checkout done or server timeout"
msg "Starting make..."

rm -rf "$srcdir/$_gitname-build"
git clone $_gitname $_gitname-build
cd "$_gitname-build"

sed -i '1a\#include <cstdio>' common.cpp >t 

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr . 
make

}

package() {

cd "$srcdir/$_gitname-build"

make DESTDIR=$pkgdir install

install -Dm755 qbat $pkgdir/usr/bin/qbat
install -Dm644 res/qbat.png $pkgdir/usr/share/qbat/icons/qbat.png
install -m644 res/qbat2.svg $pkgdir/usr/share/qbat/icons/qbat2.svg
install -Dm644 qbat.desktop $pkgdir/usr/share/applications/qbat.desktop

}

