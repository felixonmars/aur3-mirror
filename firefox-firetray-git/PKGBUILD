#Maintainer: Alex Ferrando <alferpal@gmail.com>
#Contributor: Clement Demoulins <clement@archivel.fr>

pkgname=firefox-firetray-git
pkgver=0.5.1rc1
pkgrel=1
pkgdesc="A firefox system tray extension for linux"
arch=('i686' 'x86_64')
url="https://github.com/foudfou/FireTray"
license=('GPL')
depends=('firefox>=7')
makedepends=('git' 'unzip' 'zip')

source=('git://github.com/foudfou/FireTray.git')
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
