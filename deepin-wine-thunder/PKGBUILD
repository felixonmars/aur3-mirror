# Maintainer: psi23 <killerpsi23 at gmail dot com>
# Contributor: Liu Wei <mylwjef@gmail.com>
# Contributor: Chen Xing <cxcxcxcx@gmail.com>

pkgname=deepin-wine-thunder
_pkgname=deepinwine-thunder5
pkgver=0.0.4
pkgrel=1
pkgdesc='Wine Thunder5 by Deepin Linux Team'
arch=('i686' 'x86_64')
url="http://www.linuxdeepin.org/"
license=('Other')
source=("http://packages.linuxdeepin.com/deepin/pool/non-free/d/${_pkgname}/${_pkgname}_${pkgver//_/-}_all.deb" 
        "wine-thunder5.diff")
depends=('wine' 'wqy-microhei')
md5sums=('2140427e1ba57fb65ba98108952001a0'
         '4db12921e9d0ed39bfa5c00dc6dc05e5')

package()
{
    tar xzvf ${srcdir}/data.tar.gz -C ${pkgdir}/
    cd ${pkgdir}/usr/share/deepinwine/thunder5
    patch -p0 < ${srcdir}/wine-thunder5.diff
}

