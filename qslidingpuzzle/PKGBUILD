 
# Contributor: said

pkgname=qslidingpuzzle
pkgver=0.21
pkgrel=1
pkgdesc=" An image sliding puzzle game. (e.g. boss puzzle, 15 puzzle...)"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/qSlidingPuzzle?content=127556"
license=('GPL')
depends=('qt>=4.6')
source=(http://qslidingpuzzle.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('92df1e776be12824013599e04e2c117d')

build() {
    cd  $srcdir/$pkgname-$pkgver
    qmake
    make
}

package() {
    cd  $srcdir/$pkgname-$pkgver
    install -Dm755 qSlidingPuzzle $pkgdir/usr/bin/$pkgname
}
