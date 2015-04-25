# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=qtcreator-arduino
pkgver=10f21fb
pkgrel=1
pkgdesc="Qtcreator wizard for arduino based on arduino-mk"
url="https://github.com/moonshadow565/qtcreator-arduino"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('qtcreator' 'arduino-mk')
makedepends=('git')
conflicts=()
replaces=()
backup=()
source=("git+https://github.com/moonshadow565/qtcreator-arduino.git")
md5sums=('SKIP')
_gitname=qtcreator-arduino
 
pkgver () {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  cd $_gitname
  mkdir -p "$pkgdir/usr/share/qtcreator/templates/wizards"
  cp -R arduino/ "$pkgdir/usr/share/qtcreator/templates/wizards"
  chmod -R 755 "$pkgdir/usr/share/qtcreator/templates/wizards/arduino"
}