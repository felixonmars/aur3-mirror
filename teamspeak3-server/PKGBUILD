# Maintainer: EnteEnteEnte <ducksource@duckpond.ch>
# Original uploader: Malte Rabenseifner <mail@malte-rabenseifner.de>
# vim:set ts=2 sw=2 et:

pkgname='teamspeak3-server'
pkgver='3.0.11.3'
pkgrel=1
pkgdesc='A proprietary VoIP conference software'
arch=('i686' 'x86_64')
url='http://www.teamspeak.com/'
license=('custom')
makedepends=('curl')
depends=('')
backup=('etc/conf.d/teamspeak3-server')
install="${pkgname}.install"
source_i686=("http://teamspeak.gameserver.gamed.de/ts3/releases/${pkgver}/${pkgname}_linux-x86-${pkgver}.tar.gz")
source_x86_64=("http://teamspeak.gameserver.gamed.de/ts3/releases/${pkgver}/${pkgname}_linux-amd64-${pkgver}.tar.gz")
source=('teamspeak3-server.conf.d'
        'teamspeak3-server.service')
sha1sums=('20e412b117104d1505428ae3af916407a5a6d6b1'
          '20e87e568ec46893468b18bc70a2162386a68045')
sha1sums_i686=('b3ae189b1d7d11c755d260a15d175517fa824afb')
sha1sums_x86_64=('07f2c6baac0c0b2cfd020e9b44ce6c514eae4e8c')

if [ "${CARCH}" == "x86_64" ]; then
  _TSARCH='amd64'
elif [ "${CARCH}" == "i686" ]; then
  _TSARCH='x86'
fi

package() {
    cd "${srcdir}"

    install -Dm 644 "${pkgname}.conf.d" "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm 644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    install -Dm 644 "${pkgname}_linux-${_TSARCH}/libts3db_mariadb.so" "${pkgdir}/usr/lib/libts3db_mariadb.so"
    install -Dm 644 "${pkgname}_linux-${_TSARCH}/libts3db_sqlite3.so" "${pkgdir}/usr/lib/libts3db_sqlite3.so"
    install -Dm 755 "${pkgname}_linux-${_TSARCH}/ts3server_linux_${_TSARCH}" "${pkgdir}/usr/bin/${pkgname}"

    install -dm 755 "${pkgdir}/usr/share/${pkgname}"
    cp -a "${pkgname}_linux-${_TSARCH}/sql/" "${pkgdir}/usr/share/${pkgname}/"

    install -dm 755 "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a "${pkgname}_linux-${_TSARCH}/doc/" "${pkgdir}/usr/share/doc/${pkgname}"

    install -Dm 644 "${pkgname}_linux-${_TSARCH}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

