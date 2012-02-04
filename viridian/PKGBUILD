# Maintainer: Jože Prijatelj <frojnd AT frojnd.dyndns.org>
pkgname=viridian
_pkgname=Viridian
pkgver=1.2
pkgrel=2
pkgdesc="Ampache front-end"
arch=(any)
url="https://launchpad.net/viridianplayer"
license=('GPL')
depends=("dbus-python" "gstreamer0.10-python" "python2" "pygtk")
makedepends=("python2")
source=("http://launchpad.net/viridianplayer/trunk/1.2-release/+download/$_pkgname-$pkgver.tar.gz"
        "viridian.desktop")
md5sums=('f16aa9505159a21aefe6bf7366b9a764'
         '6545dbfd1fa18e69eae1bc7db71a6168')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -d -m755 "${pkgdir}/usr/share/icons/"
  install -d -m755 "${pkgdir}/usr/share/applications/"
  # Install the icons
  cp "ViridianApp.svg" "${pkgdir}/usr/share/icons/"
  cp "ViridianApp.png" "${pkgdir}/usr/share/icons/"
  # Install the .desktop menu item
  cp "../viridian.desktop" "${pkgdir}/usr/share/applications/"
}
