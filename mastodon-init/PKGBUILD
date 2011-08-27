# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=mastodon-init
pkgver=1.1
pkgrel=1
pkgdesc="A simple init system used for the Mastodon linux distribution"
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.pell.portland.or.us/~orc/Code/init/"
makedepends=('')
provides=('init')
source=('http://www.pell.portland.or.us/~orc/Code/init/init-1.1.tar.gz' 'Mastodon.inc')
md5sums=('2b8fc12797a1d96dd3d8e9aac8d220b1' 'd3e46d2a87503dcb5676eda8676c0f26')

build() {
  cd $srcdir
  rm -rf $srcdir/build #start fresh
  cp -ar $srcdir/init-$pkgver $srcdir/build
  rm $srcdir/build/Mastodon.inc
  cp $srcdir/Mastodon.inc $srcdir/build/
}

package() {
  cd $srcdir/build
  export BIN=$pkgdir
  ./Mastodon.build
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m644 $srcdir/build/COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/
}
