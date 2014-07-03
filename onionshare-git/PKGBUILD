pkgname='onionshare-git'
pkgver=0.3.2.g05ec78d
pkgrel=1
pkgdesc="OnionShare lets you securely and anonymously share a file of any size with someone"
url="https://github.com/micahflee/onionshare"
arch=('any')
license=('GPL3')
depends=('python2-stem-git' 'python2-flask')
optdepends=('python2-pyqt4: to run onionshare-gui' 'tor-browser-en: before you can share a file, you need to open Tor Browser')
source=('git+https://github.com/micahflee/onionshare')
sha512sums=('SKIP')

pkgver() {
  cd "$SRCDEST/onionshare"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/onionshare"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 644 setup/onionshare.desktop "${pkgdir}/usr/share/applications/"
  install -D -m 644 setup/onionshare80.xpm "${pkgdir}/usr/share/pixmaps/"
  chmod +x $pkgdir/usr/bin/onionshare $pkgdir/usr/bin/onionshare-gui
}

# vim:set ts=2 sw=2 et:
