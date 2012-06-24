# Maintainer: dryes <joswiseman@gmail>
pkgname='xbmc-addon-tvrage'
pkgver='1.0.3'
pkgrel=1
pkgdesc='Fetch TV show metadata from the TVRage.com API service.'
arch=('any')
url='https://github.com/thebandit/xbmc_tvrageapi_tvscraper'
license=('Custom')
depends=('xbmc')
source=("https://github.com/downloads/thebandit/xbmc_tvrageapi_tvscraper/xbmc-tvrageapi-${pkgver}.zip")
md5sums=('280d3198134ab0a14d9ed54aeba90dec')

package() {
  mkdir -p "${pkgdir}/usr/share/xbmc/addons/"
  mv "${srcdir}/metadata.tvrageapi.com/" "${pkgdir}/usr/share/xbmc/addons/"
  find "${pkgdir}/usr/share/xbmc/addons/metadata.tvrageapi.com/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/xbmc/addons/metadata.tvrageapi.com/" -type f -exec chmod 644 {} \;
}
