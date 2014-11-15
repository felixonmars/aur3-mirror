# $Id: PKGBUILD 112045 2014-05-29 00:10:5 $
# Maintainer: yafeng <yafengabc@gmail.com>

pkgname=transmission-control
pkgver=20141114
pkgrel=1
pkgdesc="A custom web UI for the daemon of the BitTorrent client Transmission"
arch=('any')
url='https://github.com/ronggang/transmission-web-control'
license=('GPL3')
depends=(transmission-cli)
optdepends=()
source=("https://github.com/ronggang/transmission-web-control/raw/master/release/transmission-control-full.tar.gz")
install=transmission-control.install

package() {
	mkdir ${pkgdir}/usr
	mkdir ${pkgdir}/usr/share
	mkdir ${pkgdir}/usr/share/transmission
	tar vxf transmission-control-full.tar.gz -C ${pkgdir}/usr/share/transmission/
	mv ${pkgdir}/usr/share/transmission/web/index.html ${pkgdir}/usr/share/transmission/web/index.htm

}
md5sums=('3f892789a4d8af46753bcc78e458a8a8')
