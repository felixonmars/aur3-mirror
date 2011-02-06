# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=pyxdialog
pkgver=0.3
pkgrel=1
pkgdesc="Python wrapper for xdialog."
arch=('i686')
url="http://www.chrisarndt.de/en/software/python/#xdialog"
license=('GPL')
depends=('python' 'xdialog')
makedepends=('python')
source=(http://www.chrisarndt.de/en/software/python/download/xdialog-$pkgver.tar.bz2)
md5sums=('64606c0fa25bc2cca9c3790896664418')

build() {
  cd "$srcdir/xdialog-$pkgver"

  python ./setup.py build
  python ./setup.py install --prefix=/usr --root=$pkgdir || return 1
}
