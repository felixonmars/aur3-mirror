# Maintainer: Tianjiao Yin <ytj000+AUR@gmail.com>

pkgname=scws
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple Chinese Words Segmentation."
arch=('i686' 'x86_64')
url="http://www.ftphp.com/scws/index.php"
license=('BSD')
source=(
    "http://www.ftphp.com/scws/down/scws-1.2.0.tar.bz2"
    'http://www.ftphp.com/scws/down/scws-dict-chs-utf8.tar.bz2'
)
noextract=("scws-dict-chs-utf8.tar.bz2")

build() {
    cd $srcdir/scws-$pkgver
    ./configure --prefix=$pkgdir/usr/
    make
}

package() {
    cd $srcdir/scws-$pkgver
    make install
    cd $pkgdir/usr/etc
    tar xjf $srcdir/scws-dict-chs-utf8.tar.bz2

    cd $srcdir/scws-$pkgver
    iconv -f cp936 -t utf-8 README -o README 
    install -Dm644 README $pkgdir/usr/share/doc/scws/README
}
md5sums=('f882abb0c5cad44ba5540935f4be0aee'
         '4bcbd3884654b1615eed8edd39fc8759')
