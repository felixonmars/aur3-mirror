# Maintainer: Andre Wayand <aur-webcal@awayand.sleepmail.com>
pkgname=webcal
pkgver=0.8.1
pkgrel=4
pkgdesc="caldav web client for davical"
arch=('any')
url="http://wiki.davical.org/w/DAViCal_Web_Client"
license=('GPL')
depends=('davical')
optdepends=(
	'apache>=1.3.0: Web server to run webcal'
	'nginx: Web server to run webcal'
)
backup=(
	"etc/httpd/conf/extra/httpd-webcal.conf"
)
install="${pkgname}.install"
changelog=ChangeLog
source=(
	"ftp://ftp.datanom.net/pub/webcal/$pkgname-$pkgver.tar.gz"
	"httpd-webcal.conf"
	"README.archlinux"
)

md5sums=('3b9b70fe8a4d16ca716545b3eeaf3c13'
         '7b2b8ee6ff514db903f003600ae1a932'
         '571931bfbb9b41f1913200645034c4c4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/srv/http"
  cp -a . "${pkgdir}/srv/http/${pkgname}"

  install -D "${srcdir}/README.archlinux" "${pkgdir}/srv/http/webcal/"

  install -d "${pkgdir}/etc/httpd/conf/extra"
  install -t "${pkgdir}/etc/httpd/conf/extra" "${srcdir}/httpd-webcal.conf"
}
