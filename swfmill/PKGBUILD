pkgname=swfmill
pkgver=0.3.3
pkgrel=1
pkgdesc="xml2swf and swf2xml processor with import functionalities"
arch=('i686' 'x86_64')
url="http://swfmill.org"
license=('GPL')
depends=('libxml2' 'libxslt' 'zlib' 'freetype2' 'libpng')
options=('!libtool')
source=(http://swfmill.org/releases/$pkgname-$pkgver.tar.gz)
md5sums=('e0fc3c4068ffe135f201e6ee864dce62')

build() {
    cd $srcdir/$pkgname-$pkgver

    # Compilation fix
    sed -i 's/<freetype\//<freetype2\//' src/swft/swft_import_ttf.cpp

    ./configure --prefix=/usr
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
}
