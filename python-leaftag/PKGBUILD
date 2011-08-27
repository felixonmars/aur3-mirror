# Contributor: William Rea <sillywilly@gmail.com>
pkgname=python-leaftag
pkgver=0.3.0
pkgrel=1
pkgdesc="A set of Python bindings for libleaftag"
url="http://www.chipx86.com/wiki/Leaftag"
options=('NOLIBTOOL')
license="GPL"
depends=('python' 'libleaftag')
makedepends=('pkgconfig')
source=(http://releases.chipx86.com/leaftag/leaftag-python/leaftag-python-$pkgver.tar.gz)
md5sums=('b5bbc95357ba363e9dc1cff44dab4c3d')

build() {
  cd $startdir/src/leaftag-python-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
