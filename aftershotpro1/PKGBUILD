# Maintainer: Patryk Kowalczyk <patryk at kowalcyzk dot ws>

pkgname=aftershotpro1
_pkgname=AfterShotPro
pkgver=1.2.0.7
pkgrel=1
pkgdesc="Legacy Professional Workflow and RAW Conversion"
arch=('i686' 'x86_64')
license=('custom')

depends=( 'libxdamage' 'glib2' 'pcre' 'libpng12' 'libgl' 'util-linux' 'freetype2' 'libsm' 'libxrender' 'fontconfig' 'bzip2' 'expat')
[ "$CARCH" = "x86_64" ] && depends=('lib32-libxext' 'lib32-libxdamage' 'lib32-glib2' 'lib32-pcre' 'lib32-libpng12' 'lib32-libgl' 'lib32-util-linux' 'lib32-freetype2' 'lib32-libsm' 'lib32-libxrender' 'lib32-fontconfig' 'lib32-bzip2' 'lib32-expat')
optdepends=('lib32-opencl-nvidia: for openCL support on nvidia')
source=("http://www.corel.com/akdlm/6763/downloads/AfterShotPro/1_2/PF/AfterShotPro_i386.rpm" LICENSE)
url="http://www.corel.com/corel/product/index.jsp?pid=prod4670071"


build() {
	bsdtar xf ${_pkgname}_i386.rpm
	mv ${srcdir}/opt ${pkgdir}/
	install -d ${pkgdir}/usr/share
	mv ${srcdir}/usr/bin ${pkgdir}/usr
	mv ${srcdir}/usr/share/{applications,pixmaps} ${pkgdir}/usr/share/
	install -d ${pkgdir}/usr/share/mime/packages/
	mv ${srcdir}/usr/share/mime/packages/* ${pkgdir}/usr/share/mime/packages/
	update-mime-database usr/share/mime
	}
md5sums=('4920236391b12f6d81432c08d6986b1e'
         '245b27770d7ce5d345b2b74c1d85112a')
