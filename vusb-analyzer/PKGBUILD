# Maintainer: Yevgeny Krasovsky <jkrasovsky-g m a i l-c o m>

pkgname=vusb-analyzer
pkgver=1.1
pkgrel=3
pkgdesc="A tool for visualizing logs of USB packets, from sniffer tools like usbmon"
arch=('any')
url="http://vusb-analyzer.sourceforge.net/"
license=('MIT')
depends=('python2' 'pygtk' 'python2-gnomecanvas')
optdepends=('psyco: install it for a nice speed boost'
            'usbmon: collect raw usb traces')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('de3a25c869178863e8ac5ed7d5f60532')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' vusb-analyzer

    mkdir -p usr/bin
    mkdir -p usr/lib/${pkgname}
    mkdir -p usr/share/licenses/${pkgname}

    cp -R ${pkgname} VUsbTools usr/lib/${pkgname}/
    install -D -m644 README.txt "usr/share/licenses/${pkgname}/LICENSE"
    ln -s -f /usr/lib/${pkgname}/${pkgname} usr/bin/vusb-analyzer
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -R usr/ "${pkgdir}"
}