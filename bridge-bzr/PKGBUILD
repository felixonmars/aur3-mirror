# Maintainer: Ner0

pkgname=bridge-bzr
pkgver=45
pkgrel=1
pkgdesc="An indicator providing quick access to previous documents, files and websites related to your current activity."
arch=('i686' 'x86_64')
url="https://launchpad.net/bridge"
license=('GPL3')
depends=('libappindicator3' 'python' 'python2-gobject' 'zeitgeist')
makedepends=('bzr' 'python2-distutils-extra')
optdepends=('zeitgeist-datasources: Integration for various apps [AUR]'
             'zeitgeist-datasource-firefox: Firefox integration [AUR]')

build() {
  bzr branch lp:bridge -r $pkgver
  cd bridge

  sed -i 's/\/opt/\/usr\/share/' ./bridge.desktop ./setup.py

  python2 setup.py install --root="$pkgdir/" --optimize=1

  sed -i 's/python/python2/' "$pkgdir/usr/share/bridge/bridge-daemon"

  install -dm755 "$pkgdir/usr/bin"
  ln -fs "/usr/share/bridge/bridge-daemon" "$pkgdir/usr/bin"
}
