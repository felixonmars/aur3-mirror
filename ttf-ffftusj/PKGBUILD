# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=ttf-ffftusj
pkgver=0
pkgrel=1
pkgdesc="A handwritten font done with India ink and based on Georgia Bold."
url="http://www.formfett.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.formfett.net/wp-content/download/FFFTusj.zip)
md5sums=('5b4ddde81c74d93db2ba5026cca279eb')

package() {
  cd ${startdir}/src
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
  install -m644 "FFF Tusj.ttf" ${startdir}/pkg/usr/share/fonts/TTF/
}
