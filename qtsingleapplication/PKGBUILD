# Maintainer: micke@sfu.ca
# Contributor: micke@sfu.ca

pkgname=qtsingleapplication
pkgver=2.6_2
origver=2.6_2
pkgrel=1
pkgdesc="Trolltech's QtSingleApplication component provides support for applications that can be only started once per user."
arch=('i686' 'x86_64')
url="http://qt.nokia.com/products/appdev/add-on-products/catalog/4/Utilities/qtsingleapplication"
depends=('qt4')
license=('lgpl')
source=(http://web.zone.ee/mehine2/aur/qtsingleapplication/qtsingleapplication-2.6_2-opensource.tar.gz)
md5sums=('db148ce708b074dc6dfd2e5c9eafe1ff');

build() {
    cd $startdir/src/${pkgname}-${pkgver}-opensource
    ./configure -library
    qmake
    make
    install -D lib/libQtSolutions_SingleApplication-2.6.so $startdir/pkg/usr/lib/libQtSolutions_SingleApplication-2.6.so
    
    install -D src/QtLockedFile $startdir/pkg/usr/include/QtSolutions/QtLockedFile
    install -D src/QtSingleApplication $startdir/pkg/usr/include/QtSolutions/QtSingleApplication
    install -D src/*.h $startdir/pkg/usr/include/QtSolutions/
    echo "==> To use: link against libQtSolutions_SingleApplication-2.6.so and include <QtSolutions/QtSingleApplication>"
}

