# Contributor: Johannes Schriewer <jschriewer@arcor.de>

pkgname=libparsifal
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple SAX style XML validating parser library"
url="http://www.saunalahti.fi/~samiuus/toni/xmlproc/"
depends=('glibc')
source=("http://www.saunalahti.fi/~samiuus/toni/xmlproc/$pkgname-$pkgver.tar.gz")
md5sums=('04b9d4e894db07bfa37147dc30e9fb49')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
  make DESTDIR="$startdir/pkg" install
}
