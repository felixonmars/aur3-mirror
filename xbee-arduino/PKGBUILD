# Maintainer: Albert Chang <albert.chang@gmx.com>
pkgname=xbee-arduino
pkgver=0.2.1
pkgrel=1
pkgdesc="Arduino library for communicating with Xbees in API mode"
arch=('any')
url='http://code.google.com/p/xbee-arduino/'
license=('GPL3')
depends=('arduino')
source=("${pkgname}-${pkgver}.zip"::"http://xbee-arduino.googlecode.com/files/${pkgname}-${pkgver}.zip")
md5sums=('07d48195ec99bdee83d6148a7256eca9')

package()
{
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/share/arduino/libraries"

    cp -rv XBee "${pkgdir}/usr/share/arduino/libraries"
}
