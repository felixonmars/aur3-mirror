# Contributor: cromo <dawid@klej.net>
pkgname=qtodo
pkgver=0.1.2
pkgrel=1
pkgdesc="A todo-list manager, designed to be simple but powerful." 
url="http://qtodo.berlios.de/" 
arch=('i686' 'x86_64')
license="GPL" 
depends=('qt3') 
conflicts=() 
replaces=() 
backup=() 
install= 
source=(http://download.berlios.de/qtodo/$pkgname-$pkgver.tar.gz qtodo.desktop)
md5sums=('33e5942bfca4629e34a7248f42ba9bd0' '8e3fb4e584c8c07cc2ce7de83522b1df')

build() { 
    cd $startdir/src/$pkgname

    . /etc/profile.d/qt3.sh

    sed -i -e 's/#include <qstring.h>/#include <cstdlib>\n#include <qstring.h>/g' $srcdir/$pkgname/src/qtodo_misc.h || exit 1

    ${QTDIR}/bin/qmake -project qtodo.pro
    ${QTDIR}/bin/qmake 
    make || return 1 
    install -m755 -D qtodo $startdir/pkg/opt/kde/bin/qtodo
    install -m644 -D $startdir/qtodo.desktop $startdir/pkg/opt/kde/share/applnk/Office/qtodo.desktop
    install -m644 -D src/todo_list.xpm $startdir/pkg/opt/kde/share/icons/hicolor/64x64/apps/qtodo.xpm
}
