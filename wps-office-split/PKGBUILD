#Author: Jove Yu <yushijun110 [at] gmail.com>
#Modify: 910JQK

pkgname=wps-office-split
_pkgname=wps-office-split
pkgver=9.1.0.4032_Alpha10
_pkgver=9.1.0.4032~a10_i386
pkgrel=3
pkgdesc="Kingsoft Office (WPS Office), without fonts and templetes."
arch=('i686' 'x86_64')
license=("Custom")
url="http://www.wps.cn/"
conflicts=('wps-office' 'kingsoft-office')
install=${_pkgname}.install 
PKGEXT=".pkg.tar"
source=("http://erhandsome.org/php/files/wps.tar.lzma")
sha1sums=('d4e8745abfe46d6fec9e9bba2aa83587334ff183')

if [ "$CARCH" = "i686" ]; then
    depends=('fontconfig' 'glib2' 'libpng12' 'libsm' 'libxext' 'libxdmcp' 'libxrender' 'libcups' 'glu' 'libgl')
elif [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-fontconfig' 'lib32-glib2' 'lib32-libpng12' 'lib32-libsm' 'lib32-libxext' 'lib32-libxdmcp' 'lib32-libxrender' 'lib32-libcups' 'lib32-glu' 'lib32-libgl')
fi
depends+=('desktop-file-utils' 'shared-mime-info' 'xdg-utils')

package()
{
    cd "${srcdir}"
    mv * "${pkgdir}"
}
