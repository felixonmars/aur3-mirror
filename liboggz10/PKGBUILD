# Maintainer: Vincent Cappe <vcappe at gmail dot com>
# Contributor: Jeff Bailes <thepizzaking at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=liboggz10
_opkgname=liboggz
pkgver=1.0.2
pkgrel=1
pkgdesc="A simple programming interface for reading and writing Xiph.Org files and streams. 1.0.x branch."
arch=('i686' 'x86_64')
url="http://www.xiph.org/oggz/"
license=('custom:CSIRO')
depends=('libogg' 'sh')
conflicts=('liboggz')
options=('!libtool')
source=("http://downloads.xiph.org/releases/$_opkgname/$_opkgname-$pkgver.tar.gz"
        'compat-symlinks.fix')
md5sums=('39368dd201b581cab634da5db6e6b32f'
         'e44aa5ab6a48a52d0d238bbc751c0ca8')

build() {
  cd "$srcdir/$_opkgname-$pkgver"
  patch -p0 -i "$srcdir/compat-symlinks.fix"

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$_opkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
