# Maintainer: M0Rf30

pkgname=xbmc-addon-pulsar-icanuck
pkgver=2.0.0
pkgrel=1
pkgdesc='Pulsar Providers specially crafted addons to function with the Pulsar Video Addon'
classname=repository.icanuck
arch=('any')
url='http://sourceforge.net/projects/icanuckxbmcrepo/'
license=('GPL3')
depends=('xbmc' 'xbmc-addon-pulsar')
source=("http://downloads.sourceforge.net/project/icanuckxbmcrepo/${classname}-${pkgver}.zip")

package() {
  mkdir -p "${pkgdir}/usr/share/xbmc/addons/"
  cp -r "${srcdir}/${classname}/" "${pkgdir}/usr/share/xbmc/addons/"
  find "${pkgdir}/usr/share/xbmc/addons/${classname}/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/xbmc/addons/${classname}/" -type f -exec chmod 644 {} \;
}

md5sums=('46564a802c27aef8d72cd2ef57b53a33')
