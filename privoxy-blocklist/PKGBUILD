# Contributor: Andrwe Lord Weber <andrwe at andrwe dot org>

pkgname=privoxy-blocklist
pkgver=0.2
pkgrel=2
pkgdesc="Script which converts Adblock Plus blocklist to privoxy format."
arch=('any')
url=http://andrwe.org/doku.php/scripting/bash/privoxy-blocklist
license=('CC')
depends=("sed" "wget" "privoxy" "bash")
source=("http://andrwe.org/doku.php/scripting/bash/${pkgname}?do=export_code&codeblock=0")
md5sums=('3869de93201a7302acea0860b01b6c2a')

build() {
	cd ${srcdir}
	install -d ${pkgdir}/usr/sbin/
	install -d ${pkgdir}/etc/cron.weekly/
	install -m 700 -o root -g root "${pkgname}?do=export_code&codeblock=0" ${pkgdir}/usr/sbin/${pkgname}
	echo -e "#!/bin/bash\n/usr/sbin/${pkgname}" > "${pkgdir}/etc/cron.weekly/${pkgname}"
	chmod 755 "${pkgdir}/etc/cron.weekly/${pkgname}"
} 
