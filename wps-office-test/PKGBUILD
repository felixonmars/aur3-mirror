#Maintainer: Jove Yu <yushijun110 [at] gmail.com>

pkgname=wps-office-test
_pkgname=wps-office
pkgver=8.1.0.3839_Alpha9
_pkgver=8.1.0.3839~a9_i386
pkgrel=1
pkgdesc="Kingsoft Office is an office productivity suite. THIS IS TEST PACKAGE"
arch=('i686' 'x86_64')
license=("Custom")
url="http://www.wps.cn/"
sha1sums=('ff27e524831a16b2fb87515587f69fafa5ef0218')
install=${_pkgname}.install 
PKGEXT=".pkg.tar"
source=("http://wdl.cache.ijinshan.com/wps/download/Linux/unstable/${_pkgname}_${_pkgver}.deb")

if [ "$CARCH" = "i686" ]; then
    depends=('fontconfig' 'glib2' 'libpng12' 'libsm' 'libxext' 'libxdmcp' 'libxrender' 'libcups' 'glu' 'libgl')
elif [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-fontconfig' 'lib32-glib2' 'lib32-libpng12' 'lib32-libsm' 'lib32-libxext' 'lib32-libxdmcp' 'lib32-libxrender' 'lib32-libcups' 'lib32-glu' 'lib32-libgl')
fi
depends+=('desktop-file-utils' 'shared-mime-info' 'xdg-utils')

package()
{
    cd "${srcdir}"
    tar azxvf data.tar.gz -C "${pkgdir}"

    ##去掉方正字体
    #rm -r "${pkgdir}/usr/share/fonts/"
}
