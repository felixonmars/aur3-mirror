# Maintainer: Vanya A. Sergeev <vsergeev at gmail dot com>
pkgname=vpicdisasm
pkgver=1.3
pkgrel=5
epoch=
pkgdesc="A Microchip PIC disassembler for Baseline, Mid-Range, and Mid-Range Enhanced 8-bit PIC cores"
arch=('i686' 'x86_64')
url="https://github.com/vsergeev/vpicdisasm"
license=('GPL2')
depends=('glibc')

source=("https://github.com/vsergeev/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('f44dcda38177d07ba3bce638651fee3c')
sha1sums=('17c96507fc76fbfa13f7618bf0ef52ebc07e3007')
sha256sums=('a83dbe94939404e122e67a2ac64477ef4dd1c784fb2f0c27e0d885ffcb9d7c4d')
sha384sums=('46999be8c02a54e90146948354f46b1c13d776d739e97227f717bf6c65e4474521375f1b47366fd397106dc5a0a3fb92')
sha512sums=('61422759e4a70835c9e3d27303982b65f3808c3fa4aa5df4cef171e214038060f7f1b706c2a9a6fea8ccb3f19200ea974cc58d70a525600295927d420f78916d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -s -m 0755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
