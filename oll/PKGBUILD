# Maintainer: smly <eowner at gmail dot com>

pkgname=oll
pkgver=0.02
pkgrel=1
pkgdesc="A library supporting several for online-learning algorithms."
arch=(i686 x86_64)
license=('BSD')
makedepends=()
url="http://oll.googlecode.com/"
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz"
	"LICENSE")
md5sums=('b687b47e4452c9dd9e9decfd7a007de4'
	 '4967e06cbec61aaccb7d8a9b83e3be34')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install

    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname
}
