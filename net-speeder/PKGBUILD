# Maintainer: Peter Cai <xqsx43cxy@gmail.com>

pkgname=net-speeder
pkgver=0.1
pkgrel=1
pkgdesc="A network optimizing tool for high-delay network environment (ROOT NEEDED)"
url="https://code.google.com/p/net-speeder/"
arch=('x86_64' 'i686')
license=('Unknown')
depends=('libnet' 'libpcap')
source=("http://net-speeder.googlecode.com/files/net_speeder-v${pkgver}.tar.gz")
md5sums=('bd828d3fa295deaf65938143ecdaa27f')

build() {
    cd "${srcdir}/net_speeder"
    sh build.sh
}

package() {
    install -Dm755 "${srcdir}/net_speeder/net_speeder" "${pkgdir}/usr/bin/net_speeder"
}
