pkgname=monodevelop-python
pkgver=2.9.4
pkgrel=1
pkgdesc="Python language support for monodevelop"
arch=('i686' 'x86_64')
url="http://monodevelop.com"
license=('GPL')
depends=('gtk-sharp-2' 'monodevelop>=2.7' 'mono-addins' 'python2')
makedepends=('mono')
source=(http://origin-download.mono-project.com/sources/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('9d82d412ae10f7d9ed1d4cef600d41ff')

build() {
  export MONO_SHARED_DIR="$startdir/src/.wabi"
  mkdir -p "$MONO_SHARED_DIR"

  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
