# Maintainer: Beerstorm <beerstorm.emberbeard@gmail.com>
pkgname='gamebuino-lib'
pkgver=1.0
pkgrel=1
pkgdesc='Libraries for the Gamebuino, an Arduino-based console'
arch=('i686' 'x86_64')
url='http://gamebuino.com/'
license=('GPL3')
depends=('arduino')
makedepends=()
source=('https://github.com/Rodot/Gamebuino/archive/master.zip')
md5sums=('e6bb53afe62f0e990a74d5b44933b308')

_rep_name='Gamebuino-master'

package() {
	mkdir -p $pkgdir/usr/share/arduino
	cp -r $_rep_name/{hardware,libraries} $pkgdir/usr/share/arduino
}
