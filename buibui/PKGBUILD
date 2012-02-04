# Maintainer: Pierre Bourdon <delroth@gmail.com>

pkgname=buibui
pkgver=1.3.0rc3
pkgrel=1
pkgdesc="A GTK+ NetSoul client"
license=("GPL")
url="http://buibui.sourceforge.net/"
depends=('gtk2' 'libxml2' 'openssl')
source=(http://lamsonproject.com/releases/$pkgname-$pkgver.tar.gz)
source=(http://downloads.sourceforge.net/project/buibui/Unix%20%28source%20with%20autotools%29/$pkgname-$pkgver.tar.bz2)
arch=('i686' 'x86_64')
md5sums=('d213611b9fd26e5d81aa428421970a40')

build() {
    cd $srcdir/$pkgname-$pkgver
    LDFLAGS="" ./configure --prefix=/usr
    make
    make DESTDIR=$pkgdir install
}
