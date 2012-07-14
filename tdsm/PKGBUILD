# Maintainer: David Keatts <david.keatts@gmail.com>
pkgname=tdsm
pkgver=b38
pkgrel=1
pkgdesc="A dedicated server for Terraria"
arch=('i686' 'x86_64')
url="http://www.tdsm.org"
license=('GPL')
depends=('screen' 'mono')
provides=("${_pkgname}")
install="${pkgname}.install"
source=("Terraria_Server.exe::http://www.tdsm.org/index.php?board=10.0"
        'tdsm'
        'tdsm-rc'
        'server.properties')
md5sums=('1565b8a1289e9208b411ed9de1e54f34'
         '0287b1eca231738ea7d93e45269d45fd'
         '4bb567aca979260dcea49267ef72c612'
         '14a6e953bd4fac41f6cc8cbf4b9a605d')

package() {
  install -Dm755 "${srcdir}/tdsm" "${pkgdir}/usr/bin/tdsm"
  install -Dm755 "${srcdir}/tdsm-rc" "${pkgdir}/etc/rc.d/tdsm"

  install -m755 -d "${pkgdir}/srv/tdsm"
  install -Dm644 "${srcdir}/Terraria_Server.exe" "${pkgdir}/srv/tdsm/Terraria_Server.exe"
  install -Dm644 "${srcdir}/server.properties" "${pkgdir}/srv/tdsm/server.properties"
}
