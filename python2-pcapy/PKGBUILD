# Contributor: Tom Wambold <tom5760@gmail.com>
pkgname=python2-pcapy
pkgver=0.10.8
pkgrel=2
pkgdesc='Python module for the libpcap packet capture library.'
arch=('i686' 'x86_64')
url='http://corelabs.coresecurity.com/index.php?module=Wiki&action=view&type=tool&name=Pcapy'
license=('APACHE')
depends=('python2' 'libpcap')
source=("pcapy-$pkgver.tar.gz::http://corelabs.coresecurity.com/index.php?module=Wiki&action=attachment&type=tool&page=Pcapy&file=pcapy-$pkgver.tar.gz"
        'pcapy_open_live_lo_error.patch'
        'LICENSE')
md5sums=('f975fa8f0f6b51cf607649d28e2ccb5a'
         '5d769b66a832eed58a75dd48634a45b2'
         'aad04e351e4ddd12cac6158470d8d886')

package() {
    cd "$srcdir/pcapy-$pkgver"
    patch -p1 -i "$srcdir/pcapy_open_live_lo_error.patch"
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -D "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
