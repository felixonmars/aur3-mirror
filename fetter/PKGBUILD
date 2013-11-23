# Maintainer: dcell <sesshomaru@hushmail.com>

pkgname=fetter
pkgver=1.1
pkgrel=8
pkgdesc="Lightweight, fast, utility to display system information and distro text on terminal startup or take screenshots."
url="https://aur.archlinux.org/packages/fetter/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gcc' 'imagemagick')
source=("https://dl.dropboxusercontent.com/s/z5fg063gtxdfhm5/fetter.zip")
sha512sums=('43ae3f7fd19774cd114f48e458538151008c29b5c73b560807f4c63864d6ed960cab9ff534ecabb5c37ccf8aa4e4a1c7bab317e0d2de9c59a63a61cbb2e1ca85')
package() {
    mkdir -p $pkgdir/usr/bin
    
    g++ -Wall -g -w -c $srcdir/fetter.cpp -o $srcdir/fetter.o
    g++ -o $pkgdir/usr/bin/fetter $srcdir/fetter.o
    chmod +x $pkgdir/usr/bin/fetter
}
