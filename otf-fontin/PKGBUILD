# Maintainer: Darexon <cren331 aT gmailDOTcom>

pkgname=otf-fontin
pkgver=1
pkgrel=1
pkgdesc="A font designed to be used at small sizes. Includes Fontin and Fontin Sans"
arch=('any')
url="http://www.exljbris.com"
license=('custom:exljbris-font-free')
conflicts=('ttf-exljbris')
install=otf-fontin.install
source=('http://www.exljbris.com/dl/fontin_pc.zip'
        'http://www.exljbris.com/dl/FontinSans_49.zip'
        'exljbris-font-free')
sha256sums=('ddbb4ba57d0ab7d1af9d511de8e68d0fab9beec0c03eaf9c968f180b96100aa7'
            '8b04ea509ec5fa8ddf921c94ba1824130071d16b7f83b09bc257b9311ff65a6e'
            'ff395b35bdc5a824b0ec1869a37398dc5e4c712e676c20b5a15b922cfafab2ab')
package() {
    mkdir -p $pkgdir/usr/share/fonts/OTF/
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    install -m 644 -D *.otf ${pkgdir}/usr/share/fonts/OTF/
    install -m 644 -D exljbris-font-free ${pkgdir}/usr/share/licenses/$pkgname/
}
