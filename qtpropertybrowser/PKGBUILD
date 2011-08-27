# Maintainer: micke@sfu.ca
# Contributor: micke@sfu.ca

pkgname=qtpropertybrowser
pkgver=2.5_1
origver=2.5_1
pkgrel=1
pkgdesc="A Qt property browser framework enabling the user to edit a set of properties."
arch=('i686' 'x86_64')
url="http://qt.nokia.com/products/appdev/add-on-products/catalog/4/Widgets/qtpropertybrowser"
depends=('qt>=4.0')
license=('lgpl')
source=(http://get.qt.nokia.com/qt/solutions/lgpl/${pkgname}-${pkgver}-opensource.tar.gz)
md5sums=('d78b036f541400314c11133b5095c39a');

build() {
    cd $startdir/src/${pkgname}-${pkgver}-opensource
    ./configure -library
    qmake
    make
    mkdir -p $startdir/pkg/usr/include/QtSolutions/
    install -D lib/libQtSolutions_PropertyBrowser-2.5.so $startdir/pkg/usr/lib/libQtSolutions_PropertyBrowser-2.5.so
    install -D src/Qt* $startdir/pkg/usr/include/QtSolutions/    
    install -D src/*.h $startdir/pkg/usr/include/QtSolutions/
    install -D src/*.pri $startdir/pkg/usr/include/QtSolutions/
    echo "==> To use: link against libQtSolutions_PropertyBrowser-2.5.so and include (for example) <QtSolutions/QtTreePropertyBrowser>"

}

