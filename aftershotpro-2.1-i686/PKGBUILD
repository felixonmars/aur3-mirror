# Maintainer: Ole Martin Handeland <aur _at_ olemartin _dot_ org>

pkgname=aftershotpro-2.1-i686
_pkgname=AfterShotPro
pkgver=2.1.2.10
pkgrel=2
pkgdesc="Professional Workflow and RAW Conversion (version 2.1.2.10, i686, for plugin compatibility)"
arch=('i686' 'x86_64')
license=('custom')
depends=( 'libxdamage' 'glib2' 'pcre' 'libpng12' 'libgl' 'util-linux' 'freetype2' 'libsm' 'libxrender' 'fontconfig' 'bzip2' 'expat')
[ "$CARCH" = "x86_64" ] && depends=('lib32-libxext' 'lib32-libxdamage' 'lib32-glib2' 'lib32-pcre' 'lib32-libpng12' 'lib32-libgl' 'lib32-util-linux' 'lib32-freetype2' 'lib32-libsm' 'lib32-libxrender' 'lib32-fontconfig' 'lib32-bzip2' 'lib32-expat')

optdepends=('opencl-nvidia')
source=("http://dwnld.aftershotpro.com/updates/v2/${pkgver}/AfterShotPro2.rpm" LICENSE)
url="http://www.corel.com/corel/product/index.jsp?pid=prod4670071"

build() {
    bsdtar xf ${_pkgname}2.rpm
}

package() {
    cd "$srcdir"
        mkdir ${pkgdir}/opt
    mv opt/* ${pkgdir}/opt/
        install -d ${pkgdir}/usr/share
        mv usr/bin ${pkgdir}/usr
        mv usr/share/{applications,pixmaps} ${pkgdir}/usr/share/
        install -d ${pkgdir}/usr/share/mime/packages/
        mv usr/share/mime/packages/* ${pkgdir}/usr/share/mime/packages/
        update-mime-database usr/share/mime
}

md5sums=('774ac2c0bf38f8005688aa0d090bd1ea' '245b27770d7ce5d345b2b74c1d85112a')
