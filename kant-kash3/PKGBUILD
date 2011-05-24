#Contributor: karnath <karnathtorjian@gmail.com>

pkgname=kant-kash3
pkgver=2008.07.31
pkgrel=2
pkgdesc="KANT is a software package for mathematicians interested in algebraic number theory"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.math.tu-berlin.de/~kant/kash.html"
source=(
    'ftp://ftp.math.tu-berlin.de/pub/algebra/Kant/Kash_3/KASH3-Linux-i686-2008-07-31.tar.bz2'
    kash3
    license
)
md5sums=(
    '3373d76d7a4ae9586db16bc4e1885cf8'
    '56018752b0d0465cee233841adf766a8'
    'd0cf51c34f557458949610696776b313'
)

build() {
    
    cd $startdir/src/KASH3-Linux-i686-2008-07-31
    mkdir -p $startdir/pkg/opt/$pkgname

    cp -a ./ $startdir/pkg/opt/$pkgname
    
    install -D -m755 $startdir/kash3 \
	$pkgdir/usr/bin/kash3
    install -D -m755 $startdir/license $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

