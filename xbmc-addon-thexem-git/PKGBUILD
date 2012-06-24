# Maintainer: dryes <joswiseman@gmail>
pkgname='xbmc-addon-thexem-git'
pkgver=20120621
pkgrel=1
pkgdesc='Fetch TV show metadata from TheTVDB.com via TheXEM.de proxy service.'
arch=('any')
url='https://github.com/thebandit/xbmc_thexem_tvscraper'
license=('Custom')
depends=('xbmc')
makedepends=('git')

_gitroot='git://github.com/thebandit/xbmc_thexem_tvscraper.git'
_gitname='xbmc_thexem_tvscraper'

build() {
  cd "${srcdir}"
  msg 'Connecting to GIT server....'

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg 'The local files are updated.'
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg 'GIT checkout done or server timeout'
}

package() {
  mkdir -p "${pkgdir}/usr/share/xbmc/addons/"
  cp -r "${srcdir}/${_gitname}/metadata.tvdb.xem.de/" "${pkgdir}/usr/share/xbmc/addons/"
  find "${pkgdir}/usr/share/xbmc/addons/metadata.tvdb.xem.de/" -type d -name '.git' -exec rm -rf {} \;
  find "${pkgdir}/usr/share/xbmc/addons/metadata.tvdb.xem.de/" -type f -exec chmod 644 {} \;
}
