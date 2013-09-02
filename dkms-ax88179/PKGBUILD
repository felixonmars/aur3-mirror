pkgname=dkms-ax88179
pkgver=1.5.0
pkgrel=1
pkgdesc="A kernel module for the ASIX USB 3.0 AX88179 ethernet controller (DKMS version)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dkms' 'linux-headers')
provides=("ax88179=${pkgver}")
conflicts=('ax88179')
install=${pkgname}.install
options=(!strip)
url='http://www.asix.com.tw/products.php?op=pItemdetail&PItemID=131;71;112&PLine=71'
_pkgname=ax88179_178a
source=("http://www.asix.com.tw/FrootAttach/driver/AX88179_178A_LINUX_DRIVER_v${pkgver}_SOURCE.tar.bz2"
'dkms.conf')

sha1sums=('a5c8b66ba0098675393c4e73ff6f58cea039dfab'
          'da67257adc55a1a0320af7240d583fa6b0dab4dd')

package() {
    install -dm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
    install -m644 "$srcdir/AX88179_178A_LINUX_DRIVER_v${pkgver}_SOURCE/"* "$pkgdir/usr/src/$_pkgname-$pkgver"
    install -m644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver"
}
