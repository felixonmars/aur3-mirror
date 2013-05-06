# Maintainer: Gadget3000 <gadget3000 at msn dot com>
pkgname=hackterm
pkgver=0.0.1
pkgrel=1
pkgdesc="A terminal emulator capable of displaying basic Regis and inline PNG graphics"
arch=('x86_64')
url="http://41j.com/hterm/"
license=('GPL')
depends=("glibc>=2.15" "openssl>=1.0.0" "zlib>=1.1.4")
source=("http://41j.com/hterm/bins/hterm_$pkgver-1_amd64.deb")
md5sums=('05b491c8582c4c0403576dd726bdc7eb') #generate with 'makepkg -g'

build() {
    cd "$srcdir"
    ar x "hterm_$pkgver-1_amd64.deb"
    tar xzf data.tar.gz
}

package() {
    cd "$srcdir"
    install -Dm755 bin $pkgdir/usr/bin/hackterm
}
