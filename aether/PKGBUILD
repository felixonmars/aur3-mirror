# Maintainer: Luke Snow <lukesnow@tfwno.gf>
pkgname=aether
pkgver=1.2.3
pkgrel=0
pkgdesc="Anonymous and Encrypted distributed network."
arch=('any')
options=('!strip')
url="http://getaether.net"
license=("custom")
source=("https://github.com/nehbit/aether-public/releases/download/v${pkgver}-LNX-TAR/aether_${pkgver}.tar.bz2"
"https://raw.githubusercontent.com/nehbit/aether-public/master/LICENSE.md")
sha256sums=('efbc51b6b9cdc575df7df6a7ef7fee4919ee9a662bcef5e40ef4459d53670a8d'
            'b9cca7c724f2243df304571bfc4cf7bac0ee1db567d2b90e44c0940b31eac000')

package() {
mkdir -p ${pkgdir}/usr/bin/${pkgname} 
cp -R ${srcdir}/${pkgname}/* ${pkgdir}/usr/bin/aether/
install -D -m644 ${srcdir}/${pkgname}/Assets/Aether.desktop "${pkgdir}/usr/share/applications/Aether.desktop"
install -D -m644 ${srcdir}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

