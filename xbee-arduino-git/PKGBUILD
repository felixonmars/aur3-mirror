# Maintainer: Albert Chang <albert.chang@gmx.com>
pkgname=xbee-arduino-git
pkgver=r40.197e360
pkgrel=1
pkgdesc="Arduino library for communicating with Xbees in API mode"
arch=('any')
url='https://github.com/andrewrapp/xbee-arduino'
license=('GPL2')
makedepends=('git')
depends=('arduino')
source=("${pkgname}::git+https://github.com/andrewrapp/xbee-arduino.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  dest="${pkgdir}/usr/share/arduino/librarires/XBee/"
  mkdir -p $dest

  rm -rf .git*

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm LICENSE

  cp -rv . $dest
}
