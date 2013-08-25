pkgname=brscan-skey
pkgver=0.2.4_1
pkgrel=2
pkgdesc="Brother scan-key-tool"
depends=('sane' 'sed')
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('GPL' 'custom:Brother commercial license')
install=brscan-skey.install
if [ $CARCH = 'x86_64' ]; then
    source=("http://pub.brother.com/pub/com/bsc/linux/dlf/${pkgname}-${pkgver/_/-}.x86_64.rpm")
    md5sums=('9ad29a0ef9f8f4d6f742fb4293ee08a6')
else
    source=("http://pub.brother.com/pub/com/bsc/linux/dlf/${pkgname}-${pkgver/_/-}.i386.rpm")
    md5sums=('c6bc7a501f424541130a1b9a38b76493')
fi

build() {
    mkdir -p "$srcdir"/usr/bin
    ln -sf /opt/brother/scanner/brscan-skey/brscan-skey "$srcdir"/usr/bin/brscan-skey
}

package() {
    cp -R "$srcdir"/{opt,usr} "$pkgdir"
}
