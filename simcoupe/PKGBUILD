# Maintainer: serbalgi at gmail dot com
# Contributor: fuzzix at gmail dot com
pkgname=simcoupe
pkgver=1.0
pkgrel=2
pkgdesc="SAM Coupé emulator"
arch=('i686' 'x86_64')
url="http://www.simcoupe.org/"
license=('GPL2')
depends=('gcc-libs' 'saasound>=3.2' 'sdl>=1.2.11' 'zlib')
makedepends=('gendesk' 'imagemagick')
source=("http://prdownloads.sourceforge.net/simcoupe/SimCoupe-$pkgver.tar.gz"
        'build_flags.patch')
sha256sums=('bdd1360fea39a4a6ef42eb64e96c2556b00bb7aa5a77afdda84ad0d43e404773'
            'cd6a23937e93e644863d3b7827da25cdb1f8625b8e2a0006ebbc4a38456a5bae')

prepare() {
  # create .desktop file
  gendesk -f -n \
          --pkgname="$pkgname" \
          --pkgdesc="SAM Coupé emulator" \
          --name="SimCoupe" \
          --comment="SAM Coupé emulator" \
          --exec="$pkgname" \
          --categories="Game;Emulator"

  # create icon file
  convert "$srcdir/SimCoupe/Win32/Icons/main.ico[4]" "$srcdir/$pkgname.png"

  # use hardened flags
  cd "$srcdir/SimCoupe"
  patch -Np0 -i "$srcdir/build_flags.patch"
}

build() {
  cd "$srcdir/SimCoupe/SDL"
  make
}

package () {
  cd "$srcdir/SimCoupe/SDL"
  install -D -m 755 simcoupe "$pkgdir/usr/bin/$pkgname"
  install -D -m 644 "$srcdir/SimCoupe/SimCoupe.txt" "$pkgdir/usr/share/doc/$pkgname/SimCoupe.txt"
  install -D -m 644 "$srcdir/SimCoupe/ChangeLog.txt" "$pkgdir/usr/share/doc/$pkgname/ChangeLog.txt"
  install -D -m 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m 644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
