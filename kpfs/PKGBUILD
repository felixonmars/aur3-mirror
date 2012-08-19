# Maintainer: lainme <lainme993@gmail.com>
pkgname=kpfs
pkgver=0.1
pkgrel=1
pkgdesc='A filesystem for accessing kuaipan.cn based on FUSE.'
arch=('i686' 'x86_64')
url='http://code.google.com/p/kpfs/'
license=('LGPL')
depends=('fuse' 'json-c' 'liboauth' 'glib2')
makedepends=('gtk-doc' 'automake' 'autoconf' 'libtool' 'gcc')
backup=('usr/share/kpfs/kpfs.conf')
source=("http://kpfs.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('7c2465adddc1ffef2afc0f3f3b7ccf02')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's/gets(\(.*\))/fgets(\1,64,stdin)/' src/kpfs_oauth.c

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
