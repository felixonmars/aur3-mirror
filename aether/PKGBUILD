# Maintainer: Luke Snow <lukesnow@tfwno.gf>
pkgname=aether
pkgver=1.2.2
pkgrel=1
pkgdesc="Anonymous and Encrypted distributed network."
arch=('any')
options=('!strip')
url="http://getaether.net"
license=("custom")
source=("https://github.com/nehbit/aether-public/releases/download/v${pkgver}-LNX-TAR/aether_${pkgver}.tar.bz2"
"https://raw.githubusercontent.com/nehbit/aether-public/master/LICENSE.md")
sha256sums=('c9c849a0e50da8a0b09a0c571d2fc9a2f8b26439a4e613621b597a8079d378e0'
            'b9cca7c724f2243df304571bfc4cf7bac0ee1db567d2b90e44c0940b31eac000')

package() {
mkdir -p ${pkgdir}/usr/bin/${pkgname} 
cp -R ${srcdir}/${pkgname}/* ${pkgdir}/usr/bin/aether/
install -D -m644 ${srcdir}/${pkgname}/Assets/Aether.desktop "${pkgdir}/usr/share/applications/Aether.desktop"
install -D -m644 ${srcdir}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

