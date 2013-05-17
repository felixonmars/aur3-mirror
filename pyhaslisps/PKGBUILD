# Maintainer: Alexej Magura <agm2819*gmail*>
# 
# 
pkgname=pyhaslisps
pkgver=1.07
pkgrel=1
pkgdesc="A python program that returns the available implementations of common lisp."
arch=('i686' 'x86_64')
url="https://bitbucket.org/agalog/releases"
license=('BSD')
depends=('python2')
source=("$pkgname-${pkgver}.tar.gz")
md5sums=("7df4cce19fdce659eca8acc361d002d9")

build() {
    cd $srcdir/$pkgname-$pkgver

    make
}



package() {

    cd $srcdir/$pkgname-$pkgver

    make DESTDIR=$pkgdir REALNAME=$pkgname install
}

