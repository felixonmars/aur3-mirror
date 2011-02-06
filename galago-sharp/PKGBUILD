# Contributor: William Rea <sillywilly@gmail.com>
pkgname=galago-sharp
pkgver=0.5.0
pkgrel=1
pkgdesc="Galago .NET Bindings"
arch=(i686 x86_64)
url="http://www.galago-project.org"
license="LGPL"
depends=('dbus-sharp' 'libgalago')
source=(http://www.galago-project.org/files/releases/source/galago-sharp/galago-sharp-$pkgver.tar.gz)
md5sums=('87fb532cfe2085f81fe824c17f8836eb')

build() {
  export MONO_SHARED_DIR=$startdir/src/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $startdir/src/$pkgname-$pkgver
  sed -i "s/AC_PATH_PROG(NUNIT/AC_PATH_PROG(MONO-NUNIT/" configure.ac
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  rm -rf $MONO_SHARED_DIR
}
