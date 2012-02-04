# Maintainer: Vincent Cappe <vcappe at gmail dot com>
# Contributor: Jeff Bailes <thepizzaking at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=liboggz
pkgver=1.1.1
pkgrel=1
pkgdesc="A simple programming interface for reading and writing Xiph.Org files and streams."
arch=('i686' 'x86_64')
url="http://www.xiph.org/oggz/"
license=('custom:CSIRO')
depends=('libogg' 'sh')
options=('!libtool')
source=("http://downloads.xiph.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"
        'compat-symlinks.fix')
md5sums=('3649a657f8e368b881ba8b1b57381ff7'
         'e44aa5ab6a48a52d0d238bbc751c0ca8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i "$srcdir/compat-symlinks.fix"

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
