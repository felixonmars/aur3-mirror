# Maintainer: Somasis <somasis@cryptolab.net>

pkgname=syncthing-gtk-git
pkgver=v0.3.2.r70.g862b496
pkgrel=2
pkgdesc="GTK3 & python based GUI and notification area icon for Syncthing"
arch=('any')
url="https://github.com/kozec/syncthing-gui"
license=('GPL2')

provides=('syncthing-gtk')
conflicts=('syncthing-gtk')
depends=('python2' 'python2-gobject' 'python2-dateutil' 'gtk3' 'syncthing>=0.9.15')
source=(git://github.com/kozec/syncthing-gui.git)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/syncthing-gui"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/syncthing-gui"
    python2 setup.py build
}

package() {
    cd "$srcdir/syncthing-gui"
    python2 setup.py install --root=$pkgdir --optimize=1
}

