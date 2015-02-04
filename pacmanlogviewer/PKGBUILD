# Contributor: Giuseppe Calà <jiveaxe@gmail.com>
 
pkgname=pacmanlogviewer
pkgver=1.3.1
pkgrel=2
pkgdesc="Inspect pacman log file."
arch=('i686' 'x86_64')
url=('https://opendesktop.org/content/show.php?content=150484')
license=('GPL')
depends=('qt4')
source=("http://qt-apps.org/CONTENT/content-files/150484-$pkgname-$pkgver.tar.gz")
 
md5sums=('da1bb1c4573b20dc4d2ff764a25c0479')
 
package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
    make DESTDIR="$pkgdir" install
} 