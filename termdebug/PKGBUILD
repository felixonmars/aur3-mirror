pkgname='termdebug'
pkgver=1.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://os.ghalkes.nl/termdebug.html"
source="http://os.ghalkes.nl/dist/$pkgname-$pkgver.tgz"
pkgdesc='a tool for recording in- and output of terminal applications'
license='GPL2'
md5sums=('88b733c22a92bf9d6234892db529aaf7')

build() {
   cd $pkgname-$pkgver
   ./configure --prefix=/usr
   make
}

package() {
   cd "$srcdir/$pkgname-$pkgver"
   make prefix="$pkgdir/" install
}

