# Contributor: Wes Brewer <brewerw@gmail.com>
pkgname=rippedwire
pkgver=1.0.1
pkgrel=2
pkgdesc="A GTK frontend wrapper for the Handbrake CLI"
arch=('any')
url="http://rippedwire.sourceforge.net"
license=('GPL')
depends=('handbrake' 'gtk-sharp-2')
source=(http://downloads.sourceforge.net/rippedwire/handbrakegtk${pkgver}.tar.gz
        RippedWire.desktop)
md5sums=('7fcf0d5ffa2030fbffc9958cf58d74bc'
         'b3d2ea04de59b383ef81a2d2ba97d001')

package() {
  cd "$srcdir/handbrakegtk_$pkgver"

  # Copy binaries..
  install -Dm644 HandBrakeGTK $pkgdir/usr/bin/HandBrakeGTK.exe

  # Copy desktop icon and desktop link..
  install -D -m644 Images/icon.png \
    $pkgdir/usr/share/pixmaps/handbrakegtk.png
  install -D -m644 $srcdir/RippedWire.desktop \
    $pkgdir/usr/share/applications/RippedWire.desktop
}
