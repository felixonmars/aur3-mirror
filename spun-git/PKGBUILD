# Maintainer: oskar <oskarhollmann {at} gmail [dot] com>
# PKGBUILD created by: george <rpubaddr0 {at} gmail [dot] com>
# Originally from the Chakra User Repository
 
pkgname=spun-git
_pkgname=spun
pkgver=20120827
pkgrel=1
pkgdesc='A simple pacman update notifier from the Chakra project. Spun uses notify-send, has minimal dependencies and offers kdialog configuration.'
arch=('any')
url='http://github.com/george2/spun/'
screenshot='http://github.com/george2/spun/raw/master/spun.png'
license=('none')
conflicts=('spun' 'spun-live')
depends=('libnotify' 'bash')
optdepends=('kde-baseapps: for the kdialog gui')
 
_gitname="${_pkgname}"
_gitroot="git://github.com/george2/${_gitname}.git"
_locales=( ca de el es fr it pl )
 
 
build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."
 
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    cd ..
  else
    git clone $_gitroot $_gitname
  fi
 
  msg "GIT checkout done or server timeout"
}
 
package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 spun "${pkgdir}/usr/bin/spun"
  install -Dm644 spun.conf "${pkgdir}/etc/spun.conf"
  install -Dm755 spun.desktop "${pkgdir}/usr/share/autostart/spun.desktop"
 
  # localization
  for lc in ${_locales[@]}; do
    install -dm755 "${pkgdir}/usr/share/locale/$lc/LC_MESSAGES/"
    msgfmt -o "${pkgdir}/usr/share/locale/$lc/LC_MESSAGES/spun.mo" \
      "lang/$lc.po"
  done
}
