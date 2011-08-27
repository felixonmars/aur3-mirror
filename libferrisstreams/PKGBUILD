# Contributor: William Rea <sillywilly@gmail.com>
pkgname=libferrisstreams
pkgver=0.5.0
pkgrel=1
pkgdesc="A library from Modern C++ Design"
url="http://witme.sourceforge.net/libferris.web"
options=('NOLIBTOOL')
license="GPL"
depends=('ferrisloki' 'glib2')
source=(http://dl.sourceforge.net/sourceforge/witme/ferrisstreams-$pkgver.tar.bz2)
md5sums=('443c95333a44aaa58233f1975375b283')

build() {
  cd $startdir/src/ferrisstreams-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

}
