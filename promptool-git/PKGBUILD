#Maintainer: max-k <max-k AT post DOT com>
#Contributor: Army <uli armbruster who uses the google mail service>

pkgname=promptool-git
_gitname=promptool
pkgver=20120815.f38d09c
pkgrel=2
pkgdesc="A GTK interface for making shell prompts written in python"
arch=('any')
url="https://github.com/wisp558/promptool"
license=(GPL3)
depends=('pygtk')
makedepends=('git')
provides=('promptool')
conflicts=('promptool')
source=('git://github.com/wisp558/promptool.git' 'promptool.sh')
md5sums=('SKIP' '397573dbef2b1bf01ec65ace09b6582e')

pkgver() {
  cd ${_gitname}
  _rev=$(git rev-parse --short HEAD)
  _date=$(date +%Y%m%d -d "@$(git show --format="%at" ${rev} | head -n1)")
  echo ${_date}.${_rev}
}

build() {
  echo "" > /dev/null
}

package() {
  cd ${srcdir}
  install -D promptool.sh ${pkgdir}/usr/bin/promptool
  cd ${_gitname}
  install -d ${pkgdir}/opt/${_gitname}
  install -D main.py ${pkgdir}/opt/${_gitname}/
  install -D preferences.py ${pkgdir}/opt/${_gitname}/
  install -Dm644 helper.py ${pkgdir}/opt/${_gitname}/
  install -Dm644 dicts.py ${pkgdir}/opt/${_gitname}/
  install -d ${pkgdir}/opt/${_gitname}/shell
  install -Dm644 shell/* ${pkgdir}/opt/${_gitname}/shell/
}
