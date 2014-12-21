#Maintainer: anex <assassin.anex[@]gmail.com>
#Contributor: Clement Demoulins <clement@archivel.fr>
#Contributor: Alex Ferrando <alferpal@gmail.com>

pkgname=thunderbird-firetray-appind-git
pkgver=0.5.3rc1.7.g389e6ce
pkgrel=1
pkgdesc="A thunderbird system tray extension for linux with appindicator support"
arch=('i686' 'x86_64')
url="https://github.com/foudfou/FireTray"
license=('GPL')
depends=('thunderbird>=7' 'libappindicator-gtk2')
makedepends=('git' 'unzip' 'zip')
provides=('thunderbird-firetray')
conflicts=('thunderbird-firetray' 'thunderbird-firetray-git')

source=('git://github.com/foudfou/FireTray.git#branch=appind')
md5sums=('SKIP')

_thunderbird_dir='/usr/lib/thunderbird'
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
  mkdir -p "${pkgdir}"/"${_thunderbird_dir}"/extensions/"${_extension_id}"
  unzip firetray*.xpi -d "${pkgdir}"/"${_thunderbird_dir}"/extensions/"${_extension_id}"
}

# vim:set ts=2 sw=2 et:
