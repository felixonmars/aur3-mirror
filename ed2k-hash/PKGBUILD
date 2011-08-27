# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Matthew Sharpe <matt.sharpe@gmail.com>

pkgname=ed2k-hash
_pkgname=ed2k_hash
pkgver=0.4.0
pkgrel=1
pkgdesc="A little utility that takes an number of files and outputs their ed2k-links"
arch=('i686' 'x86_64')
url="http://ed2k-tools.sourceforge.net/ed2k_hash.shtml"
license="GPL2"
#depends=('fltk')
source=(http://downloads.sourceforge.net/ed2k-tools/${_pkgname}-$pkgver.tar.gz \
  JobQueue.patch \
  Configuration.patch)
md5sums=('545d44d5e00078011f41a18e235f4af8'
         '38eeb9c0ebd5cad917fde1c2bd7d9118'
         'e0cad2b48d289d05883280798160d8ba')

build() {
  cd $srcdir/$_pkgname-$pkgver
  patch -p0 -i ../JobQueue.patch || return 1
  patch -p0 -i ../Configuration.patch || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install
}
