# Maintainer: M0Rf30

pkgname=xbmc-addon-superrepo-adult
pkgver=0.5.1
pkgrel=1
pkgdesc='The world largest XBMC addon repository containing more than 1.300 addons'
classname=repository.superrepo.org.gotham.others.adult
arch=('any')
url='http://superrepo.org/'
license=('GPL3')
depends=('xbmc')
source=("http://mirrors.superrepo.org/addons/gotham/${classname}/${classname}-${pkgver}.zip")

package() {
  mkdir -p "${pkgdir}/usr/share/xbmc/addons/"
  cp -r "${srcdir}/${classname}/" "${pkgdir}/usr/share/xbmc/addons/"
  find "${pkgdir}/usr/share/xbmc/addons/${classname}/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/xbmc/addons/${classname}/" -type f -exec chmod 644 {} \;
}

md5sums=('9d9a310a2936ebaebc23a5ed289d8cdd')
