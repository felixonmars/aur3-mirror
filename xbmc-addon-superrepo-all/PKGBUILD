# Maintainer: M0Rf30

pkgname=xbmc-addon-superrepo-all
pkgver=0.5.205
pkgrel=1
pkgdesc='The world largest XBMC addon repository containing more than 1.300 addons'
classname=repository.superrepo.org.gotham.all
arch=('any')
url='http://superrepo.org/'
license=('GPL3')
depends=('xbmc')
source=("http://mirrors.superrepo.org/addons/gotham/${classname}/${classname}-${pkgver}.zip")
optdepends=('xbmc-addon-superrepo-adult: enable adult addons for XBMC')

package() {
  mkdir -p "${pkgdir}/usr/share/xbmc/addons/"
  cp -r "${srcdir}/${classname}/" "${pkgdir}/usr/share/xbmc/addons/"
  find "${pkgdir}/usr/share/xbmc/addons/${classname}/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/xbmc/addons/${classname}/" -type f -exec chmod 644 {} \;
}

md5sums=('2ce70f6d641e052e26c311576b183b79')
