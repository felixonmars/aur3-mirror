daemonname=youtrack
pkgname=${daemonname}-daemon
pkgver=6.0.12463
pkgrel=2
pkgdesc="Issue Tracker and Agile Project Management Tool - Systemctl Daemon"
url="https://www.jetbrains.com/youtrack/index.jsp"
license="nonfree"
arch=(i686 x86_64)
depends=('java-runtime'
         'youtrack'
        )
install=$daemonname.install
source=('youtrack.service'
        'youtrack.conf'
        )
md5sums=('b93b1649511d4eeaf1ce6fc44d45d79d'
         '604b3dde279a41dd7ae69fcacdf92d6c')

package() {
  mkdir -p "${pkgdir}/etc/conf.d"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"

  cp "${srcdir}/youtrack.service" "${pkgdir}/usr/lib/systemd/system/"
  cp "${srcdir}/youtrack.conf" "${pkgdir}/etc/conf.d/${daemonname}"
}
