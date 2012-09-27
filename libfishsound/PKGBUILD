# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: farid <farid at archlinux-br.org>

pkgname=libfishsound
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple programming interface that wraps Xiph.Org audio codecs"
arch=('i686' 'x86_64')
url="http://www.xiph.org/fishsound/"
license=('custom:BSD')
depends=('libvorbis' 'speex' 'flac')
makedepends=('libtool')
options=('!libtool')
source=("http://downloads.xiph.org/releases/libfishsound/$pkgname-$pkgver.tar.gz")
md5sums=('02c5c7b361a35c9da3cf311d68800dab')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" docdir=./docs install
  install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
