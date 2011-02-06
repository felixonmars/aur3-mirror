# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>
pkgname=mfstool
pkgver=0.5pre
_pkgver=0.5
pkgrel=1
pkgdesc="Minix Fileystem Tool"
arch=('i686' 'x86_64')
url=("http://mfstool.sourceforge.net/")
license=('GPL')
depends=('glibc')
source=("http://heanet.dl.sourceforge.net/project/mfstool/mfstool/0.5-pre/mfstool-0.5pre.tar.gz")
md5sums=('c4f60b667f4998f266175e38fb430eaf')

build() {
  cd "$srcdir/$pkgname-${_pkgver}"

  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$pkgname-${_pkgver}"
  make DESTDIR="$pkgdir" install
}
