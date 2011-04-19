pkgname=grafx2
pkgver=2.3.1781
pkgrel=1
pkgdesc="A pixelart-oriented painting program"
arch=('i686' 'x86_64')
url="http://code.google.com/p/grafx2/"
license=('GPL2')
depends=('sdl_ttf' 'sdl_image' 'bash' 'lua')
source=(http://grafx2.googlecode.com/files/$pkgname-$pkgver-src.tgz)
md5sums=('916a35c4762e85b4210a1041fbbfd830')

build() {
    cd "$srcdir/$pkgname/src"
    install -Dm644 "$srcdir/$pkgname/doc/gpl-2.0.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1   
    install -Dm644 "$srcdir/$pkgname/doc/README.txt" \
        "$pkgdir/usr/share/doc/$pkgname/readme.txt" || return 1
    make || return 1
    make prefix="/usr" DESTDIR="$pkgdir" install
}

