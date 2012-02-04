# Maintainer: wido <widomaker2k7@gmail.com>

pkgname=cuda-multiforcer
pkgver=0.72
pkgrel=1
pkgdesc="Multihash CUDA Brute Forcer"
url="http://www.cryptohaze.com/multiforcer.php"
license=('LGPL')
arch=('any')
depends=('nvidia')
source=(http://cryptohaze.com/releases/CUDA-Multiforcer-Linux-$pkgver.tar.bz2
        cuda-multiforcer)
md5sums=('81fb99572d35d90ebef32e3892510506'
         '2d80f601d5be4e7ad6570c33da573fc3')

build() {
    cd $srcdir/CUDA-Multiforcer-Linux-$pkgver
    mkdir -p $pkgdir/opt/$pkgname
    cp -r $srcdir/CUDA-Multiforcer-Linux-$pkgver/* $pkgdir/opt/$pkgname/
    install -Dm755 $startdir/$pkgname $pkgdir/usr/bin/$pkgname
}
