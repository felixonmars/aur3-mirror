pkgname=monodevelop-java
pkgver=2.9.4
pkgrel=1
pkgdesc="Java language support for monodevelop"
arch=('i686' 'x86_64')
url="http://monodevelop.com"
license=('GPL')
depends=('gtk-sharp-2' 'monodevelop>=2.7' 'mono-addins' 'java-environment')
makedepends=('mono')
source=(http://origin-download.mono-project.com/sources/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('932134d4c6f214d1c78f0c4d440399a2')


build() {
  export MONO_SHARED_DIR="$startdir/src/.wabi"
  mkdir -p "$MONO_SHARED_DIR"

  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
