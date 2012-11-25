# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=unity-scope-gdocs
pkgver=0.7
pkgrel=1
pkgdesc="Unity Lens that allows you to browse and search your Google Documents"
arch=('any')
url="https://launchpad.net/unity-scope-gdrive"
license=('GPL')
depends=('unity-lens-files' 'python-gobject' 'libgdata' 'account-plugins')
makedepends=('python-distutils-extra')
install=$pkgname.install
source=(http://launchpad.net/unity-scope-gdrive/12.10/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('6f7408887444b0ba74813fdd42fd088b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python3 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python3 setup.py install --root=$pkgdir/ --optimize=1
}
