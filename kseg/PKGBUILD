# Contributor: Zsolt Udvari <udvzsolt@gmail.com>
pkgname=kseg
pkgver=0.403
pkgrel=1
pkgdesc="An interactive geometry program for exploring Euclidean geometry"
arch=('i686' 'x86_64')
url="http://www.mit.edu/~ibaran/kseg.html"
license=('GPL')
depends=('qt3')
source=(http://www.mit.edu/~ibaran/${pkgname}-${pkgver}.tar.gz)
md5sums=('5474516091e5c4206179cfa03bb7c263')

build() {
  cd "$srcdir/$pkgname"
  QTDIR=/opt/qt/ /opt/qt/bin/qmake
  QTDIR=/opt/qt make
}

package() {
    cd "$srcdir/$pkgname"
    install -d $pkgdir/usr/{bin,share/{kseg/translations,doc/kseg/examples}}
    install -m755 kseg $pkgdir/usr/bin
    install -m644 *.qm $pkgdir/usr/share/kseg/translations
    install -m644 examples/* $pkgdir/usr/share/doc/kseg/examples
    install -m644 *.html $pkgdir/usr/share/doc/kseg
}
