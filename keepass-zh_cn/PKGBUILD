pkgname=keepass-zh_cn
pkgver=2.24
pkgrel=1
pkgdesc="Simplifed Chinese locale for keepass"
license=('GPL')
depends=('keepass>=2.24')
makedepends=('unzip')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Chinese_Simplified.zip)
md5sums=('8cf398a14e5822682967c921239e143e')
arch=('any')
package(){
    mkdir -p "${pkgdir}"/usr/share/keepass
    install -m644 Chinese_Simplified.lngx $pkgdir/usr/share/keepass/Chinese_Simplified.lngx
}
