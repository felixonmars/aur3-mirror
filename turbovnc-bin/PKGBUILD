# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Kaspar Bumke <kaspar dot bumke at gmail dot com>

pkgname=turbovnc-bin
_srcname=turbovnc
pkgver=1.1.95
pkgrel=1
pkgdesc="An optimized version of TightVNC"
arch=('i686' 'x86_64')
url="http://virtualgl.org"
license=('GPL')
depends=('libxaw' 'libxext' 'libxt')
options=(!strip)

if [ "${CARCH}" = "x86_64" ]; then 
   _ar=x86_64
   md5sums=('7202dd6c68086309455fb44659b276e3')
else
   _ar=i386
   md5sums=('7e36eb3a4d5ff0eb0607f28e0260041d')
fi 

#source=(${_srcname}-${pkgver}.tar.gz::http://sourceforge.net/projects/virtualgl/files/TurboVNC/${pkgver}/${_srcname}-${pkgver}.${_ar}.rpm/download)
source=(${_srcname}-${pkgver}.tar.gz::http://sourceforge.net/projects/virtualgl/files/TurboVNC/${pkgver}%20%281.2rc%29/${_srcname}-${pkgver}.${_ar}.rpm/download)

package() {
  cd "${srcdir}"
  mv usr opt etc "${pkgdir}"
  mv "${pkgdir}"/etc/init.d "${pkgdir}"/etc/rc.d
}
