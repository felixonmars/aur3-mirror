pkgname=opensched
pkgver=0.4.4
pkgrel=1
pkgdesc="Opensched is a tool for project management."
arch=('i686' 'x86_64')
url="http://opensched.sourceforge.net/"
license=('GNU')
depends=()
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz?use_mirror=softlayer 'patch')
md5sums=('69355588c81dc354f1838f88521a4932' '3f3a0b9c94227183de05f4101acb7a4c')

build() {
    cd $srcdir/$pkgname-$pkgver
    patch -p1 < ../patch
    ./configure --prefix=$pkgdir/usr/
    make
    make install || return 1
}
