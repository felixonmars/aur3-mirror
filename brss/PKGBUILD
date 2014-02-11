# Maintainer: Bidossessi Sodonon <bidossessi.sodonon@yahoo.fr>

pkgname=brss
pkgver=0.9
pkgrel=1
pkgdesc="Offline RSS reader"
arch=('i686' 'x86_64')
url="https://github.com/bidossessi/brss"
license=('GPL')
depends=('python2' 'dbus-python' 'python2-gobject' 'python2-feedparser' 'python2-pysqlite' 
            'gtk3' 'libwebkit3' 'libnotify' 'glib2' 'gettext')
makedepends=()
makedepends=('git')
provides=('brss')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://github.com/bidossessi/$pkgname/archive/$pkgver.tar.gz)
install=brss.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('3a2fb29bf138b08bf724f87b17206028')
