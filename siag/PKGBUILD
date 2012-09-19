# Maintainer: lspci <agm2819[a t]g   ma   i l[do t] c  o m>
pkgname=siag
pkgver=3.6.1
pkgrel=1
pkgdesc="A free office package for Unix"
arch=('i686' 'x86_64')
url="http://siag.nu"
license=('GPL')
groups=()
depends=('nextaw' 'mowitz')
makedepends=()
optdepends=()
provides=()
conflicts=('siag-office')
replaces=()
backup=()
options=()
#install=
#changelog=
source=("http://siag.nu/pub/siag/$pkgname-$pkgver.tar.gz")
md5sums=('3d00dda22209327bb907ba78850c797f') # generate with 'makepkg -g'

build() { 
    cd "$srcdir/$pkgname-$pkgver"
    ./configure 
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
