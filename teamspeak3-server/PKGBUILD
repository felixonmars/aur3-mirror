# Maintainer: EnteEnteEnte <ducksource@duckpond.ch>
# Original uploader: Malte Rabenseifner <mail@malte-rabenseifner.de>
# vim:set ts=2 sw=2 et:

pkgname="teamspeak3-server"
pkgver="3.0.11.2"
pkgrel=2
pkgdesc="A proprietary VoIP conference software"
arch=('i686' 'x86_64')

if [ "${CARCH}" == "x86_64" ]; then
  _TSARCH='amd64'
  _TSSHA1='4bb6c213528d5953fa34f3c30bd06e857339a836'
else
  _TSARCH='x86'
  _TSSHA1='5909128319900a5540f7fbf8c2f9c5da4825fbad'
fi

url="http://www.teamspeak.com/"
license=('custom')
makedepends=('curl')
depends=('bash')
backup=('etc/conf.d/teamspeak3-server')
install="${pkgname}.install"
source=("http://teamspeak.gameserver.gamed.de/ts3/releases/${pkgver}/${pkgname}_linux-${_TSARCH}-${pkgver}.tar.gz"
        'teamspeak3-server.conf.d'
        'teamspeak3-server.service')
sha1sums=("${_TSSHA1}"
          '20e412b117104d1505428ae3af916407a5a6d6b1'
          '20e87e568ec46893468b18bc70a2162386a68045')

package() {
    cd "${srcdir}"
    
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -d "${pkgdir}/usr/share/${pkgname}/sql"
    install -dm 0750 "${pkgdir}/var/lib/${pkgname}"
    install -dm 0750 "${pkgdir}/var/log/${pkgname}"
    
    install -Dm 644 "${pkgname}.conf.d" "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm 644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    install -Dm 644 "${pkgname}_linux-${_TSARCH}/libts3db_mariadb.so" "${pkgdir}/usr/lib/libts3db_mariadb.so"
    install -Dm 644 "${pkgname}_linux-${_TSARCH}/libts3db_sqlite3.so" "${pkgdir}/usr/lib/libts3db_sqlite3.so"
    install -Dm 755 "${pkgname}_linux-${_TSARCH}/ts3server_linux_${_TSARCH}" "${pkgdir}/usr/bin/${pkgname}"

    cp -a "${pkgname}_linux-${_TSARCH}/sql/"* "${pkgdir}/usr/share/${pkgname}/sql"
    cp -a "${pkgname}_linux-${_TSARCH}/doc/"* "${pkgdir}/usr/share/doc/${pkgname}"

    install -Dm 644 "${pkgname}_linux-${_TSARCH}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

