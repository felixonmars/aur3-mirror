# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=cdi2iso
pkgver=0.1
pkgrel=3
pkgdesc="A very simple utility to convert DiscJuggler image to the standard ISO-9660 format"
arch=('i686' 'x86_64')
url="http://developer.berlios.de/projects/cdi2iso"
license=('GPL')
depends=('glibc')
source=("http://download.berlios.de/$pkgname/$pkgname-$pkgver-src.tar.bz2")
md5sums=('feffdaab9f0785167a5ead1a23e0f9e2')

build() {
 cd "$srcdir/$pkgname"
 make
}

package() {
 install -D -m755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
