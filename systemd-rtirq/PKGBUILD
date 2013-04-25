# Maintainer: VirtualTam <virtualtam@myopera.com>
pkgname=systemd-rtirq
_pkgname=rtirq
pkgver=20130402
pkgrel=2
pkgdesc="Startup scripts for tuning the realtime scheduling policy and priority of relevant IRQ service threads."
arch=('any')
url="http://www.rncbc.org/jack/"
license=('GPL')
conflicts=('rtirq')
backup=('etc/conf.d/rtirq')
install=${pkgname}.install
source=(http://www.rncbc.org/jack/${_pkgname}-${pkgver}.tar.gz 
        rtirq.service )
md5sums=(
    '7f35732049e7dfaeed73d5658b584e81'
    '459b62353e05d1f6cf05867465a294d5')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  sed -e "s|etc/sysconfig/rtirq|etc/conf.d/rtirq|" -i rtirq.sh
  sed -e "s|IRQ\.|irq/|" -i rtirq.sh   
  install -vDm755 "${srcdir}/${_pkgname}-${pkgver}/rtirq.sh" "${pkgdir}/etc/rc.d/rtirq"
  install -vDm644 "${srcdir}/rtirq.service" "${pkgdir}/usr/lib/systemd/system/rtirq.service"
  install -vDm644 "${srcdir}/${_pkgname}-${pkgver}/rtirq.conf" "${pkgdir}/etc/conf.d/rtirq"
}
