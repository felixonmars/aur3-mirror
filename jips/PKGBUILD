# Maintainer: Patrick Palka <patrick@parcs.ath.cx>

pkgname=jips
pkgver=3.0
pkgrel=1
pkgdesc="an IPS patcher written in Java"
url="http://zerosoft.zophar.net/jips.php"
arch=('any')
license=('unknown')
depends=('java-runtime' 'libx11')
zipfile=jips30.zip
source=("${zipfile}::http://www.zophar.net/download_file/3146"
        "${pkgname}")
md5sums=('ada316b93d6ee9e6dc809abb068bf0b6'
         'c1bd93c92505c51f7abc47f213caef50')

package() {
    cd ${srcdir}
    install -Dm644 "JIPS.jar" "${pkgdir}/usr/share/${pkgname}/JIPS.jar"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
