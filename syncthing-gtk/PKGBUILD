# Maintainer: kozec <kozec at kozec dot com>
pkgname=syncthing-gtk
pkgver=0.5.2
pkgrel=1
pkgdesc="GTK3 & python based GUI and notification area icon for Syncthing"
arch=('any')
url="https://github.com/kozec/syncthing-gui"
license=('GPL2')
depends=('python2' 'python2-gobject' 'python2-dateutil' 'libnotify' 'gtk3' 'syncthing>=0.10.9')
source=(https://github.com/kozec/syncthing-gui/archive/v${pkgver}.tar.gz)
optdepends=('libnotify: desktop notifications'
            'python2-pyinotify: filesystem monitoring')

build() {
  cd "$srcdir/syncthing-gtk-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/syncthing-gtk-$pkgver"

  python2 setup.py install --root=$pkgdir --optimize=1
}

md5sums=('20e5750b775acedaf51ab130e4e47644')
