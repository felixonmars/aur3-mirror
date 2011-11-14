pkgname=d-feet
pkgver=0.1.14
pkgrel=1
pkgdesc="A D-Bus debugger and explorer"
arch=(any)
url="http://live.gnome.org/DFeet/"
license=('GPL')
depends=('python2' 'pygtk' 'dbus-python' 'gtk-update-icon-cache')
makedepends=('python2-distribute')
install="d-feet.install"
source=(http://download.gnome.org/sources/d-feet/0.1/${pkgname}-${pkgver}.tar.xz)
sha256sums=('3f289333f45928beb7d56d2a9d7b9a6fcf666fb2d8e557faf8b90230897cab82')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 -O2
}
