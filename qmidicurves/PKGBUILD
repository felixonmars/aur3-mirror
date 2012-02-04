# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkgname=QMIDICurves
pkgname=qmidicurves
pkgver=1.21
pkgrel=1
pkgdesc="A simple QT/JACK application that lets you change MIDI-keyboard velocity response."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/qmidicurves/"
license=('GPL')
depends=('jack' 'qwt')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$_pkgname/$pkgver/$_pkgname$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.png")
md5sums=('24268eac7c9ae7d54299d9a992ab9717'
         'd9145d058291ef929adff6cbac39cbf4'
         'c9eaf6239115889f5b36a8ae4aa195f3')

build() {
  cd "$srcdir/$_pkgname$pkgver"

  # Includes + translations + qmake fixes
  sed -i "s|qwt-qt4|qwt|g" *MIDICurve*
  sed -i "s|LIBPATH|QMAKE_LIBDIR|;s|local||" -i $_pkgname.pro
  sed -i "s|qm|ts|g" images.qrc

  qmake -recursive CONFIG+=debug_and_release $_pkgname.pro
  make release
}

package() {
  cd "$srcdir/$_pkgname$pkgver"

  install -Dm755 $_pkgname "$pkgdir/usr/bin/$pkgname"

  # Install desktop file and pixmaps
  install -Dm644 ../$pkgname.desktop \
	"$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../$pkgname.png \
	"$pkgdir/usr/share/pixmaps/$pkgname.png"
}
