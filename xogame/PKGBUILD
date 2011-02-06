# Maintainer: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=xogame
pkgver=1.0
pkgrel=1
pkgdesc="Noughts and crosses game via Jabber protocol"
arch=('i686' 'x86_64')
url="http://tiger.ftk.spbstu.ru/trac/edu-se-2010-xo/"
license=('MIT')
depends=('java-runtime')
makedepends=('java-environment' 'apache-ant')
source=("http://tiger.ftk.spbstu.ru/trac/edu-se-2010-xo/raw-attachment/wiki/WikiStart/$pkgname-$pkgver.tar.gz")
md5sums=('06ad062fc484d2a7e4f0cb6c939209a5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}

