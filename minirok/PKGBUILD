# Contributor: enderst <enderst@gmail.com>
pkgname=minirok
pkgver=2.1
pkgrel=1
pkgdesc="small music player written in Python"
license=('MIT')
arch=('i686' 'x86_64')
url="http://chistera.yi.org/~adeodato/code/minirok/"
depends=('pyqt' 'mutagen' 'gstreamer0.10-python' 'dbus-python' 'lastfmsubmitd' 'kdebindings-python')
source=(http://chistera.yi.org/~adeodato/code/minirok/files/tarballs/$pkgname-$pkgver.tar.gz)
md5sums=('500da291eb011ff674c9968f822ab5db')

build() {
  cd $startdir/src/$pkgname-$pkgver
  DEBIAN_PREFIX=$startdir/pkg ./setup.sh install
}
