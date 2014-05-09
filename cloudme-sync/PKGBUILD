# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Laurent Hofer <laurenth at lavabit dot com>

pkgname=cloudme-sync
pkgver=1.8.0
pkgrel=1
pkgdesc="The European Sync / Storage Service desktop client"
arch=('i686' 'x86_64')
url="https://www.cloudme.com/"
license=('custom')
depends=('qt5-base' 'libgnome-keyring')
install=${pkgname}.install
source=(
    "https://www.cloudme.com/downloads/${pkgname}-${pkgver}-${pkgrel}.${CARCH}.rpm"
    "eula.txt"
    "privacy.txt"	
)
md5sums=('0cdf3f7c87b7c642c4bb5f40f35d7de2'
         'b5acb146916f7a7875ee818dbaf32297'
         '8c66a4c8e58383dbe9487cf1339d37cd')
[ "$CARCH" = 'i686' ] && md5sums[0]='9c2d571c22b8890c2037077d3f54f9d2'

package() {
    cd "$srcdir"

    # install app
    mv -v usr $pkgdir || return 1	

    # install custom license file
    install -Dm644 eula.txt ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
    install -Dm644 privacy.txt ${pkgdir}/usr/share/licenses/${pkgname}/privacy.txt
}
