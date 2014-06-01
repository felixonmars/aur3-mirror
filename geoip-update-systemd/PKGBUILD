# Maintainer: Michael Kühn <breiteseite1337@gmail.com>

pkgname=geoip-update-systemd
pkgver=1.4
pkgrel=2
pkgdesc='Updates GeoIP files via systemd.timer'
arch=('any')
url='https://github.com/BreiteSeite/archlinux-geoip-update'
license=('MIT')
depends=('systemd' 'wget' 'gzip' 'bash')
source=(geoip-update.service
        geoip-update.timer
        LICENSE)
md5sums=('66891e09735bad30e0b1cfb3a51dd22e'
         'f91c706b7fef8fcdbce91d5f389c4e8b'
	 '18a016a3a0cef884a3fab3203a9dcae3')

package() {
    cd "${srcdir}"

    install -d -m755 "${pkgdir}"/usr/share/GeoIP/

    install -d -m755 "${pkgdir}"/usr/lib/systemd/system/
    install -D -m644 geoip-update.service "${pkgdir}"/usr/lib/systemd/system/geoip-update.service
    install -D -m644 geoip-update.timer "${pkgdir}"/usr/lib/systemd/system/geoip-update.timer
    
    install -d -m755 "${pkgdir}"/usr/lib/systemd/system/timers.target.wants
    ln -s ../geoip-update.timer "${pkgdir}"/usr/lib/systemd/system/timers.target.wants/geoip-update.timer
 
    install -d -m755 "${pkgdir}"/usr/share/licenses/
    install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}
}
