# Maintainer: Vanya A. Sergeev <vsergeev at gmail dot com>
pkgname=vavrdisasm
pkgver=3.1
pkgrel=3
epoch=
pkgdesc="An 8-bit Atmel AVR disassembler"
arch=('i686' 'x86_64')
url="https://github.com/vsergeev/vavrdisasm"
license=('GPL3')
depends=('glibc')

source=("https://github.com/vsergeev/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('455f6ee8ef22ceca94798a7fa04fa716')
sha1sums=('8ac78c7ec26760ac76e25a1ff399cfc255b2bc52')
sha256sums=('4fe5edde40346cb08c280bd6d0399de7a8d2afdf20fb54bf41a8abb126636360')
sha384sums=('1d21fc9f0b58a44f6be5786fe8890f45e81a3fb0a7d2b04cd970e5771778507cedece2392c53b43681f5b16a7cf75f16')
sha512sums=('84be6250ee1ba2433f8765cdb22135ab0c5981f6aff361e7262c276cda42fb745a9912ed6de75460f542d252659271dae85601f9a2af53f1f6f7db8de8a12efd')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="${pkgdir}" install
}
