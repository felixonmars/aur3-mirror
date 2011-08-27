pkgname=kamoulbox
pkgver=1.5.0
pkgrel=1
pkgdesc="kamoulbox - Le générateur de phrases inutiles"
arch=('i686' 'x86_64')
url="http://kamoulbox.free.fr"
license=('WTFPL')
makedepends=('git')
depends=('qt')
conflicts=('kamoulbox-git')
provides=('kamoulbox')
md5sums=('ac3173b2e168ddd63fbdb9a7415ee608')

source=http://ordiclic.eu/kamoulbox/$pkgname-$pkgver.tar.gz

build() {
  cd $srcdir/$pkgname
  qmake DESTDIR=$startdir/pkg/usr/bin
  make || return 1
  make install || return 1
}
