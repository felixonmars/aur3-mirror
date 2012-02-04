# Contributor: Jari

pkgname=sam_i_am
pkgver=0.5
pkgrel=1
pkgdesc="Sam_I_Am is a program for interacting with an Atmel AT91SAM7S microcontroller running the SAM-BA monitor program."
arch=(any)
url="http://claymore.engineer.gvsu.edu/~steriana/Software/Sam_I_Am/"
license=('GPL')
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://claymore.engineer.gvsu.edu/~steriana/Software/Sam_I_Am-${pkgver}.tar.gz")
md5sums=('99e1c4e2c0d7e340fc56b4f94da9283d')

package() {
  cd "$srcdir/Sam_I_Am-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  sed -i 's/^python/python2/g' $pkgdir/usr/bin/Sam_I_Am
  chmod +x $pkgdir/usr/bin/Sam_I_Am
}

