# Contributor: rabyte <rabyte__gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libanculus-sharp
pkgver=0.3.1
pkgrel=3
pkgdesc="A reusable utility library written in C#"
arch=('i686' 'x86_64')
url="http://code.google.com/p/libanculus-sharp/"
license=('custom:MIT')
depends=('gtk-sharp-2')
makedepends=('pkgconfig>=0.9')
source=(http://libanculus-sharp.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('d89455b8d43a45666a25fc26b7792f7b')

build() {
  cd $srcdir/$pkgname-$pkgver

  export MONO_SHARED_DIR=$srcdir/.wabi || return 1
  mkdir -p $MONO_SHARED_DIR || return 1

  sh autogen.sh --prefix=/usr --disable-winforms  || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
