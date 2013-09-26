# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: <nixtrian@gmail.com>

_commit=54354da
pkgname=fragmentarium
pkgver=1.0.0
pkgrel=1
pkgdesc="An IDE for exploring pixel based graphics on the GPU"
url="http://syntopia.github.com/Fragmentarium/"
license=('GPL3' 'LGPL')
arch=('i686' 'x86_64')
depends=('qt4')
install="$pkgname.install"
source=("https://github.com/Syntopia/Fragmentarium/tarball/v$pkgver"
        "$pkgname.desktop")
md5sums=('32fc823b7f6391724e24e41aa623a615'
         '3fb947ac914bb41961d45cd105748b28')

build() {
  cd "$srcdir/Syntopia-${pkgname^}-$_commit/${pkgname^}-Source"

  # set right path for examples and misc
  sed -e "/<</s/..\/../\/usr\/share\/$pkgname/" \
      -e "s/Examples\/Include/\/usr\/share\/$pkgname\/&/" \
      -i ${pkgname^}/GUI/MainWindow.cpp

  qmake-qt4 -project -after "CONFIG+=opengl" \
                     -after "QT+=xml opengl script"
  qmake-qt4 && make
}

package() {
 cd "$srcdir/Syntopia-${pkgname^}-$_commit/${pkgname^}-Source"     

  # bin
  install -Dm755 ${pkgname^}-Source "$pkgdir/usr/bin/$pkgname"

  # extra
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a Examples Misc "$pkgdir/usr/share/$pkgname"

  # desktop file
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 Icons/fileicons/${pkgname^}-256.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
