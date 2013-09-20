# Maintainer: Janhouse <janis.jansons@janhouse.lv>

pkgname=luxtrust-middleware
pkgver=6.1
_pkgrelupstream=007
pkgrel=1
pkgdesc="Luxtrust smarcard middleware."
arch=('i686' 'x86_64')
url="https://www.luxtrust.lu/en/simple/225"
license=('custom:Proprietary')
depends=()
makedepends=('libarchive')
optdepends=()
provides=("luxtrust-middleware=$pkgver")

_arch=32
[ "$CARCH" = 'x86_64' ] && _arch=64
source=("https://www.luxtrust.lu/downloads/middleware/LuxTrust_Middleware_${_arch}bit_${pkgver}-${_pkgrelupstream}.deb")
md5sums=('36441ba5a9e48067a0c114e784bd58ff')
[ "$CARCH" = 'x86_64' ] && md5sums[0]='22378fdd8fa8763018ed698af724be82'

package() {
    cd ${srcdir}
    echo "Extracting data."
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
