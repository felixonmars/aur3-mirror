# Contributor: Andru <dr.andru@gmail.com>

pkgname=nautilus-batch-rename
pkgver=0.0.1
pkgrel=1
pkgdesc='The Nautilus Batch Rename is a Nautilus extension to rename multiple files in batch. You can select many files or folders and rename than following a standard naming using a extension very flexible.'
arch=('i686' 'x86_64')
url="http://code.google.com/p/nautilus-batch-rename/"
license=('GPL2')
depends=('nautilus')
makedepends=('intltool')
source=(http://nautilus-batch-rename.googlecode.com/files/nautilus-batch-rename-0.0.1.tar.bz2)
md5sums=('0df356f66e1fa2b3e6f89d1f36285605')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
