# Contributor: Cyker Way <cykerway@gmail.com>
# Modified: Tomas Lindquist Olsen <tomas.l.olsen@gmail.com>

pkgname=cnijfilter-ip2600series
pkgver=2.90
pkgrel=2
pkgdesc="Canon IJ Printer Driver for Pixma IP2600 series (with cnijfilter-common290)"
url="http://support-cn.canon-asia.com/contents/CN/ZH/0100271604.html"
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = 'x86_64' ]; then
    depends=('lib32-libcups' 'lib32-popt' 'libpng12')
elif [ "${CARCH}" = 'i686' ]; then
    depends=('libcups' 'popt' 'libpng12')
fi
makedepends=('rpmextract')
source=(http://gdlp01.c-wss.com/gds/6/0100001186/01/cnijfilter-common-2.90-1.i386.rpm)
md5sums=('c03ed6488910b692b02060b08139de25')

build() {
    cd ${pkgdir}
    bsdtar xvf ${srcdir}/${pkgname}-${pkgver}-1-i386-rpm/packages/cnijfilter-common-2.90-1.i386.rpm
    bsdtar xvf ${srcdir}/${pkgname}-${pkgver}-1-i386-rpm/packages/${pkgname}-${pkgver}-1.i386.rpm

    mv usr/local/bin usr/bin
    mv usr/local/share/* usr/share/
    rm -r usr/local

    mkdir -p usr/share/licenses/${pkgname}
    mv usr/share/doc/${pkgname}-${pkgver}/* usr/share/licenses/${pkgname}
    rm -rf usr/share/doc
}
