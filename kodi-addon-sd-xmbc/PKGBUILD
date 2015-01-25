# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=kodi-addon-sd-xmbc
pkgver=2.0.0
pkgrel=1
pkgdesc="Kodi SD-XBMC is a collection of addons for watching polish TV."
url="http://sd-xbmc.org/"
arch=('any')
license=('http://sd-xbmc.org/en/node/102')
classname=repository.sd-xbmc.org
depends=('kodi' 'libcec' )
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://sd-xbmc.org/repository/repository.sd-xbmc.org/repository.sd-xbmc.org-${pkgver}.zip)
md5sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/usr/share/kodi/addons/"
  cp -r "${srcdir}/${classname}/" "${pkgdir}/usr/share/kodi/addons/"
  find "${pkgdir}/usr/share/kodi/addons/${classname}/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/kodi/addons/${classname}/" -type f -exec chmod 644 {} \;
}