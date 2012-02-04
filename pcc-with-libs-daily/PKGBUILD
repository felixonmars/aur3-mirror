# Contributor: Zhang Li <msfxzi at sina.com>

pkgname=pcc-with-libs-daily
pkgver=101023
pkgrel=1
pkgdesc="A Portable C Compiler."
arch=("i686")
url="http://pcc.ludd.ltu.se/"
license=("BSD")
makedepends=("bison" "flex" "gcc")
source=(
"http://pcc.ludd.ltu.se/ftp/pub/pcc-libs/pcc-libs-$pkgver.tgz"
"http://pcc.ludd.ltu.se/ftp/pub/pcc/pcc-$pkgver.tgz"
)
md5sums=('9c779f8296fb3a9419162688c276df92'
         '118a14a4d6c50964d6530d657e61b9b7')

build() {
    cd "$srcdir/pcc-libs-$pkgver"
    env CC=gcc ./configure --prefix=/usr || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1

    cd "$srcdir/pcc-$pkgver"
    env CC=gcc ./configure --prefix=/usr || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}


