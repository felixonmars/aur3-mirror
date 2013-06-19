# Maintainer: Olivier Keshavjee <olivier.keshavjee@gmail.com>
pkgname=lexilogos
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Learn biblical greek while reading the New Testament, using the Albina system."
arch=('i686' 'x86_64')
url="https://github.com/olivierkes/lexilogos"
license=('GPL')
groups=()
depends=('qt4' 'python' 'pyqt')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/olivierkes/lexilogos/archive/v$pkgver.zip" "lexilogos")
noextract=()
md5sums=('f8edd7d6508c1ab2d8bc07e5b9a03959'
         'f06cbbff70717cf94ee8f5193c251430') #generate with 'makepkg -g'

# check() {
#   cd "$srcdir"
#   make -k check
# }

package() {
  # Installing application
  cd $srcdir/$pkgname-$pkgver
  install -d -m755 $pkgdir/usr/lib/lexilogos
  cp -r -p * $pkgdir/usr/lib/lexilogos
  install -d -m755 $pkgdir/usr/bin
  install -D -m755 $srcdir/lexilogos $pkgdir/usr/bin/lexilogos

  # Installing menu item
#   install -D -m644 icons/converter.png $pkgdir/usr/share/pixmaps/$pkgname.png
#   install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

# vim:set ts=2 sw=2 et:
