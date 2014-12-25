# Maintainer: Vanya A. Sergeev <vsergeev at gmail dot com>
pkgname=btckeygenie
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A standalone Bitcoin keypair/address generator"
arch=('i686' 'x86_64')
url="https://github.com/vsergeev/btckeygenie"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')

source=("https://github.com/vsergeev/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('8590401e41e910f01579a4bde58d08a0')
sha1sums=('30fd8cf08e5c5e84a0ba6060d2463b7b34cdd8df')
sha256sums=('73cfecf23c17cf1d622fdac2465a6452c3e8551482cb01a4c4bb305e09a7e0e8')
sha384sums=('59c4fdce711e6ce20ce33d5cd589cafd742c002204b5cb8c6670e447f0661981269930dffc30ac7d468ab0d70b272639')
sha512sums=('b300f4a8a1d241a2a252084393aad20039da414aa6012c26e298783537eca69692cb9dc93e605a737ce276ae69ba66f6d6f8174eb82f971fa38ef4aa616f8a2c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
