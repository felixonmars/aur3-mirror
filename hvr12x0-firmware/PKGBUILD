# Maintainer: kfgz <kfgz at interia pl>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=hvr12x0-firmware
pkgver=20090922
pkgrel=1
pkgdesc="Firmware for the Hauppauge HVR-12x0, HVR-14x0, HVR-17x0 series tuners"
arch=('i686' 'x86_64')
url="http://www.steventoth.net/"
license=('unknown')
#depends=('kernel26')
source=(http://www.steventoth.net/linux/hvr1200/HVR-12x0-14x0-17x0_1_25_25271_WHQL.zip
        http://www.steventoth.net/linux/hvr1200/extract.sh)
md5sums=('7fe395c1a398f079d98e416ee7be3777'
         'd95602ba28ffae4740720f1d742e9215')

build () {
  cd "${srcdir}"
  chmod 755 extract.sh
  ./extract.sh
}

package () {
  #mkdir -p ${pkgdir}/lib/firmware
  #install -m444 v4l*fw ${pkgdir}/lib/firmware
  install -dm755 "${pkgdir}"/usr/lib/firmware
  install -m644 dvb*fw "${pkgdir}"/usr/lib/firmware
}
