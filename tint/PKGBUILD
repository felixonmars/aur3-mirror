# PKGBUILD by Redroar <theymightbegiant@gmail.com> 5/21/08

pkgname=tint
pkgver=0.6.0
pkgrel=3
pkgdesc="A basic, good-looking task manager for WMs"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tint2/"
license=('MIT')
conflicts=('ttm-svn')
depends=('libxinerama' 'pango' 'imlib2')
makedepends=('pkgconfig')
source=(http://tint2.googlecode.com/files/$pkgname-$pkgver.tar.gz \
	http://aur.archlinux.org/packages/tint/tint/license.txt)
md5sums=('50a327730429373a18286b27f915fefd'
         'c183d14d3983050c46bc677747b0690e')
build() {
  # Add license
  install -D -m644 $startdir/src/license.txt $startdir/pkg/usr/share/licenses/$pkgname/license.txt || return 1
  
  # Install tint. No configure yet.. just a simple Makefile
  cd $startdir/src/$pkgname/src || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
