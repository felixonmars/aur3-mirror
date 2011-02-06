#  Maintainer: aqamar <anrras at gmail dot com>

pkgname=pyragua
pkgver=0.2.5
pkgrel=1
pkgdesc="pyragua is an python IDE developed by Semillero de investigacion de la Universidad Tecnologica de Pereira PYROX."
arch=('i686' 'x86_64')
url="http://pyragua.pyroxdev.org/"
license=('GPL')
groups=()
depends=('python' 'wxpython')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://www.pyroxdev.org/pub/$pkgname-$pkgver.tar.bz2)
noextract=()

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
 
  # Remember to install licenses if the license is not a common license!
  # install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('c871c921fa10b9a1956d4a9ba8d0f4cd')
