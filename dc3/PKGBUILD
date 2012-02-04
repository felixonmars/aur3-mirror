# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=dc3
pkgver=11.09.0
pkgrel=1
pkgdesc="An experimental, lightweight desktopcouch alternative"
arch=('any')
url="http://www.kickstarter.com/projects/novacut/novacut-pro-video-editor"
license=('LGPL3')
depends=('python2' 'couchdb' 'dbus-python' 'python2-gobject' 'libwebkit3' 'pyxdg' 'python2-microfiber')
source=("https://launchpad.net/$pkgname/trunk/11.09/+download/$pkgname-$pkgver.tar.gz")
md5sums=('a3f348bff10bd333eb07af9591c826ee')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" -O1
  sed -i "s#/usr/bin/python#/usr/bin/python2#" "$pkgdir/usr/lib/dc3/dc3-service"
}
