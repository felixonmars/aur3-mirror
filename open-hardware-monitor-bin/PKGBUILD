# Maintainer: Martijn Atema <AUR@atema.me>

pkgname=open-hardware-monitor-bin
pkgver=0.7.1_beta
pkgrel=1
pkgdesc="A free open source hardware monitoring application"
arch=('any')
license=('MPL')
url="http://openhardwaremonitor.org/"
depends=('mono')
provides=('open-hardware-monitor')
source=("http://openhardwaremonitor.org/files/openhardwaremonitor-v${pkgver//_/-}.zip" "launcher")
sha512sums=('cfbc2bbc5f47c3f92ef0d5e567d4b25e16ad3d149cdd2aa00645b3e1aa40a5707c66dd46e34c3552b796a42b66067fd74035165bf4bd07d087579c371e7e28cc' '22973195728a21a9a423da8da6d1230acb055e3afeef0aa3f8f84009b36b99572646871dac43bba02439a277fd07ca4e322f83e8f258b56fc87a4ac014442351')

package() {
    install -Dm755 launcher "$pkgdir/usr/bin/open-hardware-monitor"

    cd OpenHardwareMonitor

    install -d -m755 "$pkgdir/usr/lib/$pkgname"
    install -m755 *.dll *.exe "$pkgdir/usr/lib/$pkgname"
    install -m644 *.config "$pkgdir/usr/lib/$pkgname"

    install -Dm644 License.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"

    cd "$pkgdir/usr/bin"
    sed -i "s/\$pkgname/$pkgname/g" open-hardware-monitor
}
