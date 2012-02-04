# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=linksys-tftp
pkgver=1.2.1
pkgrel=3
pkgdesc="TFTP client designed for a non-standard tftp authentication process"
arch=('i686' 'x86_64')
url="https://aur.archlinux.org/packages.php?ID=24006"
license=('GPL')
source=("http://dl.dropbox.com/u/24716740/mirror/$pkgname-$pkgver.tar.gz")
md5sums=('f536f778dcbcb4a65838042ca0a2a454')

build() {
 cd "$srcdir/$pkgname-$pkgver"
 make
}

package() {
 install -Dm 755 "$srcdir/$pkgname-$pkgver/linksys-tftp" "$pkgdir/usr/bin/linksys-tftp"
}
