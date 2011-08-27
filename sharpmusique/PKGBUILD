# Contributor: William Rea <sillywilly@gmail.com>
pkgname=sharpmusique
pkgver=1.0
pkgrel=7
pkgdesc="An interface to the iTunes Music Store"
url="http://nanocrew.net/software/sharpmusique"
license="GPL"
depends=('gtk-sharp-2')
source=(http://nanocrew.net/sw/sharpmusique/sharpmusique-$pkgver.tar.gz \
        SharpMusique.cs)
md5sums=('f2ba373f4f72fe4867debaf0dc56ff80' '961980a67f6a73133395563208c3631c')

build() {
  export MONO_SHARED_DIR=$startdir/src/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $startdir/src/$pkgname-$pkgver
  mv ../SharpMusique.cs src/
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  
  rm -fr $MONO_SHARED_DIR
}
