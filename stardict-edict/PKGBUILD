# Maintainer: jeneshicc <jeneshicc@gmail.com>
pkgname=stardict-edict
pkgver=2.4.2
pkgrel=3
pkgdesc="Japanese-English dictionary for Stardict"
arch=('any')
url="http://stardict.sourceforge.net"
license=('custom:"The EDRDG Licence"')
source=(http://reciteword.cosoft.org.cn/stardict-iso/stardict-dic/ja/${pkgname}-${pkgver}.tar.bz2
	licence.html
	licence_files.tar.xz)

build() {
    cd ${srcdir}
    install -d ${pkgdir}/usr/share/stardict/dic
    install -m 644 ${pkgname}-${pkgver}/* ${pkgdir}/usr/share/stardict/dic/

    # install license
    install -d ${pkgdir}/usr/share/licenses/${pkgname}/licence_files
    install -m 644 licence.html ${pkgdir}/usr/share/licenses/${pkgname}/licence.html
    install -m 644 licence_files/* ${pkgdir}/usr/share/licenses/${pkgname}/licence_files/
}
md5sums=('0aa46b7d589a01663c3fb465152db85d'
         'ca075172437f6fa74b9fbf3b947ffe94'
         'a9ad4654bb3088e7832bd70ff49ff1dc')
