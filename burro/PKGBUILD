# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=burro
pkgver=0.01
pkgrel=5
pkgdesc="Cross-platform frontend to the mldonkey core"
url="http://burro.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk-sharp-2')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('0acc0fcaf634d0bfb66be434162f23b6')

build() {
  export MONO_SHARED_DIR=$srcdir/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install


  rm -rf $MONO_SHARED_DIR
}




