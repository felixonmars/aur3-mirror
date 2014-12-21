#Maintainer: anex <assassin.anex[@]gmail.com>
#Contributor: Clement Demoulins <clement@archivel.fr>
#Contributor: Alex Ferrando <alferpal@gmail.com>

pkgname=firefox-firetray-appind-git
pkgver=0.5.3rc1.7.g389e6ce
pkgrel=1
pkgdesc="A firefox system tray extension for linux with appindicator support"
arch=('i686' 'x86_64')
url="https://github.com/foudfou/FireTray"
license=('GPL')
depends=('firefox>=7' 'libappindicator-gtk2')
makedepends=('git' 'unzip' 'zip')
provides=('firefox-firetray')
conflicts=('firefox-firetray' 'firefox-firetray-git')
source=('git://github.com/foudfou/FireTray.git#branch=appind')
md5sums=('SKIP')

_firefox_dir='/usr/lib/firefox'
_extension_id='{9533f794-00b4-4354-aa15-c2bbda6989f8}'

pkgver(){
  cd FireTray
  git describe | sed sa-a.ag | sed -r 's/^.{1}//'  

}

build() {
  cd FireTray/src
  mkdir ../build-$(git rev-parse --short HEAD)
  cp ../LICENSE ../build*/
  make build
}

package() {
  cd FireTray/build*
  mkdir -p "${pkgdir}"/"${_firefox_dir}"/browser/extensions/"${_extension_id}"
  unzip firetray*.xpi -d "${pkgdir}"/"${_firefox_dir}"/browser/extensions/"${_extension_id}"
}

# vim:set ts=2 sw=2 et:
