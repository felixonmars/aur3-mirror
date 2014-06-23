# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Contributor: schuay <jakob.gruber@gmail.com>

pkgname=xbmc-eventclients-wiiremote
pkgver=13.1
pkgrel=1
_filever="${pkgver}-Gotham"
pkgdesc="XBMC Media Center Wiimote (Wii Remote) Eventclient"
arch=('i686' 'x86_64')
url="http://xbmc.org"
license=('GPL3')
depends=('xbmc' 'wiiuse' 'bluez')
source=(
  "xbmc-${pkgver}.tar.gz::https://github.com/xbmc/xbmc/archive/${_filever}.tar.gz"
  "xbmc-wiiremote.service"
)

build() {
    cd "${srcdir}/xbmc-${_filever}/tools/EventClients/Clients/WiiRemote"

    # instructions from WiiUse_README
    g++ -lwiiuse WiiUse_WiiRemote.cpp -o WiiUse_WiiRemote
}

package() {
    cd "${srcdir}/xbmc-${_filever}/tools/EventClients/Clients/WiiRemote"

    install -Dm755 WiiUse_WiiRemote "${pkgdir}"/usr/bin/xbmc-wiiremote
    install -Dm644 "${srcdir}/xbmc-${_filever}/docs/manpages/xbmc-wiiremote.1" \
        "${pkgdir}"/usr/share/man/man1/xbmc-wiiremote.1
    install -Dm755 "${srcdir}"/xbmc-wiiremote.service \
        "${pkgdir}"/usr/lib/systemd/system/xbmc-wiiremote.service
}

md5sums=('1359859ad5fc13402e1cdca3641b19bd'
         '81ba367ec9788a11aad63cf90bfb77c4')
