# Maintainer: Romain Labolle <ravomavian@gmail.com>

pkgname=bluegriffon
pkgver=1.7.2
pkgrel=1
pkgdesc='The next-generation Web Editor'
url="http://bluegriffon.org/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('libpng' 'libjpeg' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info' )
makedepends=('wget')
install='bluegriffon.install'
source=("http://bluegriffon.org/freshmeat/${pkgver}/bluegriffon-${pkgver}.Ubuntu13.04.$CARCH.tar.bz2"
        'bluegriffon.desktop'
        'bluegriffon.install'
       )
md5sums=('33ed2194189b012bb36a02a30aeb52df'
         'e532ce3a2163d91b11a19176dcf2dbe1'
         '42d885a1665f32babc8045b2041949ea'
        )
[ "$CARCH" = "x86_64" ] && md5sums[0]='fbae6365980d87dde5e4ce044d55be38'

package() {
	cd ${srcdir}
	mkdir -p ${pkgdir}/{usr/{bin,share/{applications,pixmaps}},opt}
	cp -R bluegriffon ${pkgdir}/opt/${pkgname}

	ln -s /opt/${pkgname}/bluegriffon ${pkgdir}/usr/bin/${pkgname}
	install -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
	install -m644 ${srcdir}/bluegriffon/chrome/icons/default/default48.png ${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png
}
