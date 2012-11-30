
basename=qtpropertybrowser
pkgname=mingw32-${basename}
pkgver=2.5_1
origver=2.5_1
pkgrel=1
pkgdesc="A Qt property browser framework enabling the user to edit a set of properties."
arch=('any')
url="http://qt.nokia.com/products/appdev/add-on-products/catalog/4/Widgets/qtpropertybrowser"
depends=('mingw32-runtime' 'mingw32-qt>=4.0')
makedepends=('mingw32-gcc')
options=('!strip' '!buildflags')
license=('lgpl')
source=(http://get.qt.nokia.com/qt/solutions/lgpl/${basename}-${pkgver}-opensource.tar.gz)
md5sums=('d78b036f541400314c11133b5095c39a');

build() {
    unset LDFLAGS

    cd $startdir/src/${basename}-${pkgver}-opensource/buildlib
    i486-mingw32-qmake
    make release

    mkdir -p $startdir/pkg/usr/i486-mingw32/include/QtSolutions/
    install -D ../lib/libQtSolutions_PropertyBrowser-2.5.a $startdir/pkg/usr/i486-mingw32/lib/libQtSolutions_PropertyBrowser-2.5.a
    install -D ../lib/QtSolutions_PropertyBrowser-2.5.dll $startdir/pkg/usr/i486-mingw32/lib/QtSolutions_PropertyBrowser-2.5.dll
    install -D ../lib/QtSolutions_PropertyBrowser-2.5.dll $startdir/pkg/usr/i486-mingw32/bin/QtSolutions_PropertyBrowser-2.5.dll
    install -D ../src/Qt* $startdir/pkg/usr/i486-mingw32/include/QtSolutions/    
    install -D ../src/*.h $startdir/pkg/usr/i486-mingw32/include/QtSolutions/
    install -D ../src/*.pri $startdir/pkg/usr/i486-mingw32/include/QtSolutions/
}

