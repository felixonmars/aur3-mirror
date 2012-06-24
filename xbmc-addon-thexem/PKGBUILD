# Maintainer: dryes <joswiseman@gmail>
pkgname='xbmc-addon-thexem'
pkgver='1.0.3'
pkgrel=1
pkgdesc='Fetch TV show metadata from TheTVDB.com via TheXEM.de proxy service.'
arch=('any')
url='https://github.com/thebandit/xbmc_thexem_tvscraper'
license=('Custom')
depends=('xbmc')
source=("https://github.com/downloads/thebandit/xbmc_thexem_tvscraper/xbmc-thexem.de-${pkgver}.zip")
md5sums=('b7a74cb427606bea70105df6cbb6172f')

package() {
  mkdir -p "${pkgdir}/usr/share/xbmc/addons/"
  mv "${srcdir}/metadata.tvdb.xem.de/" "${pkgdir}/usr/share/xbmc/addons/"
  find "${pkgdir}/usr/share/xbmc/addons/metadata.tvdb.xem.de/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/xbmc/addons/metadata.tvdb.xem.de/" -type f -exec chmod 644 {} \;
}
