# Maintainer: Léo Flaventin Hauchecorne <hl037 dot prog at gmail dot com>
pkgname=gede
pkgver=1.10.2
pkgrel=1
pkgdesc="Gede is a graphical frontend (GUI) to GDB written in Qt."
arch=('i686' 'x86_64')
url="http://acidron.com/gede"
license=('BSD')
groups=()
depends=('qt4' 'gdb')
makedepends=('python2')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://gede.acidron.com/uploads/source/${pkgname}-${pkgver}.tar.xz")
noextract=()
md5sums=('0402c0228ff436b9784948916bb24bb5')



build() {
  cd "$srcdir/$pkgname-$pkgver"
  # in 1.10.2, build already uses the -qt4 suffixe so the following line is commented.
  # sed -i 's/qmake/qmake-qt4/g' build.py
  python2 build.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 build.py install --prefix="$pkgdir/usr" install
  chmod 755 "$pkgdir/usr/bin/gede"
}
