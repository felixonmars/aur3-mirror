pkgname=dkms-mt7601
pkgver=v3.0.0.4
pkgrel=1
pkgdesc="Driver for Ralink MT7601 chipset wireless adaptors"
arch=('x86_64')
url="http://www.ralinktech.com"
license=('GPL')
depends=('dkms' 'linux-headers')
conflicts=()
install=${pkgname}.install
options=(!strip)
_pkgname="mt7601"
source=("git://github.com/davex25/mt7601"
        "dkms.conf")

md5sums=('SKIP'
         'c651b67a6757b682148e434025c148d7')

package() {
    installDir="$pkgdir/usr/src/$_pkgname-$pkgver"

    install -dm755 "$installDir"
    install -m644 "$srcdir/dkms.conf" "$installDir"
    install -dm755 "$pkgdir/etc/modprobe.d"

    cd "${srcdir}/mt7601/"

    for d in `find . -type d`
    do
        install -dm755  "$installDir/$d"
    done

    for f in `find . -type f -o -type l`
    do
        install -m644 "${srcdir}/mt7601/$f" "$installDir/$f"
    done
}
