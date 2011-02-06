# Maintainer: res <andres87p gmail>
pkgname=httpup
pkgver=0.4.0k
pkgrel=1
pkgdesc="One way sync over http (CRUX port)"
arch=('any')
license=('GPL')
url="http://jw.tks6.net/files/crux/${pkgname}_manual.html "
depends=('curl')
source=("http://jw.tks6.net/files/crux/$pkgname-$pkgver.tar.gz")
md5sums=('2c36fc594ba4b565763ba7314b14c729')

build() {
    cd $pkgname-$pkgver

    make
    
    mkdir -p $pkgdir/usr/{bin,share/{$pkgname,man/man8}}
    cp httpup httpup-repgen $pkgdir/usr/bin
    cp httpup.conf.example  $pkgdir/usr/share/$pkgname
    cp *.8   $pkgdir/usr/share/man/man8
}
