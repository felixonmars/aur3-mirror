# Contributor: William Rea <sillywilly@gmail.com>
pkgname=nautilus-burn-sharp
pkgver=0.2
pkgrel=2
pkgdesc="A C# wrapper for the libnautilus-burn library"
url="http://www.snorp.net/log/?page_id=52"
option=('NOLIBTOOL')
license="LGPL"
depends=('gtk-sharp-2' 'nautilus-cd-burner')
source=(http://www.snorp.net/files/libnautilus-burn-sharp/libnautilus-burn-sharp-$pkgver.tar.gz)
md5sums=('f30a467cf14641082c60b4ee129be308')

build() {
  export MONO_SHARED_DIR=$startdir/src/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $startdir/src/libnautilus-burn-sharp-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  rm -r $MONO_SHARED_DIR
}
