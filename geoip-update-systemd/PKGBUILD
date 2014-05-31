# Maintainer: Michael Kühn <breiteseite1337@gmail.com>

pkgname=geoip-update-systemd
pkgver=1.2
pkgrel=1
pkgdesc='Updates GeoIP files via systemd.timer'
arch=('any')
url='https://github.com/BreiteSeite/archlinux-geoip-update'
license=('MIT')
depends=('systemd' 'geoip' 'wget' 'gzip')
source=(geoip-update.service
        geoip-update.timer
        LICENSE)
md5sums=('3c327feed1dd30316255ce1b012db0aa'
         '729840d189aa92f63d69f626b984125d'
	 '18a016a3a0cef884a3fab3203a9dcae3')

package() {
    cd "${srcdir}"

    install -d -m755 "${pkgdir}"/usr/lib/systemd/system/
    install -D -m644 geoip-update.service "${pkgdir}"/usr/lib/systemd/system/geoip-update.service
    install -D -m644 geoip-update.timer "${pkgdir}"/usr/lib/systemd/system/geoip-update.timer
    
    install -d -m755 "${pkgdir}"/usr/lib/systemd/system/timers.target
    ln -s ../geoip-update.timer "${pkgdir}"/usr/lib/systemd/system/timers.target/geoip-update.timer
 
    install -d -m755 "${pkgdir}"/usr/share/licenses/
    install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}
}
