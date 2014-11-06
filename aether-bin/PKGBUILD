# Maintainer: Luke Snow <lukesnow@tfwno.gf>
pkgname=aether-bin
_pkgname=aether
pkgver=1.2.3
pkgrel=0
pkgdesc="Anonymous and Encrypted distributed network."
arch=('any')
options=('!strip')
url="http://getaether.net"
license=("custom")
source=("https://github.com/nehbit/aether-public/releases/download/v${pkgver}-LNX-TAR/aether_${pkgver}.tar.bz2"
"https://raw.githubusercontent.com/nehbit/aether-public/master/LICENSE")
sha256sums=('efbc51b6b9cdc575df7df6a7ef7fee4919ee9a662bcef5e40ef4459d53670a8d'
            'fb9651ab9631fcf6be5c84f88f7f8ed7c50cae8a0bfe31d4f3e90bc0b88d0dcf')

package() {
mkdir -p ${pkgdir}/usr/bin/${_pkgname} 
cp -R ${srcdir}/${_pkgname}/* "${pkgdir}/usr/bin/${_pkgname}"
install -D -m644 ${srcdir}/${_pkgname}/Assets/Aether.desktop "${pkgdir}/usr/share/applications/Aether.desktop"
install -D -m644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

