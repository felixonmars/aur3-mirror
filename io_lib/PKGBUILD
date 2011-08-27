# Contributor: Thomas Dziedzic

pkgname=io_lib
pkgver=1.12.2
pkgrel=1
pkgdesc='Io_lib is a library of file reading and writing code to provide a general purpose trace file (and Experiment File) reading interface.'
arch=('i686' 'x86_64')
url='http://staden.sourceforge.net/'
license=('BSD')
source=("http://downloads.sourceforge.net/project/staden/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('369d9976d927076d6fde469acc355a9c')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr || return 1

  make || return 1

  make DESTDIR="$pkgdir" install || return 1
}
