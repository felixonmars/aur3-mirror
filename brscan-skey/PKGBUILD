pkgname=brscan-skey
pkgver=0.2.4_1
pkgrel=4
pkgdesc="Brother scan-key-tool"
arch=('i686' 'x86_64')
url="http://support.brother.com/g/s/id/linux/en"
license=('custom:Brother')
install=brscan-skey.install
if [ $CARCH = 'x86_64' ]; then
    source=("http://pub.brother.com/pub/com/bsc/linux/dlf/${pkgname}-${pkgver/_/-}.x86_64.rpm")
    md5sums=('9ad29a0ef9f8f4d6f742fb4293ee08a6')
else
    source=("http://pub.brother.com/pub/com/bsc/linux/dlf/${pkgname}-${pkgver/_/-}.i386.rpm")
    md5sums=('c6bc7a501f424541130a1b9a38b76493')
fi
source+=('brscan-skey.service' 'http://www.brother.com/agreement/English_lpr/agree.html')
md5sums+=('9b9f324ab79f8ee772c0178a9835037e' 'bd06a5d28abb3b3a3a6a263567cbb78b')

package() {
    cp -R "$srcdir"/opt "$pkgdir"

    install -d -m755 "$pkgdir"/usr/lib/systemd/system
    install -D -m644 "$srcdir"/brscan-skey.service "$pkgdir"/usr/lib/systemd/system

    install -D -m644 "$srcdir"/agree.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
}
