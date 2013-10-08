# Contributor: Martin Berkemeier <phobinator[at]googlemail[dot]de>

pkgname=accessx
pkgver=0.951
_intpkgver=0951
pkgrel=2
pkgdesc="Accessx is an open source utility to set and display all of the XKEYBOARD (XKB) AccessX features."
arch=('i686' 'x86_64')
depends=('libx11' 'libxext' 'tk')
url="http://cita.disability.uiuc.edu/software/accessx/freewareaccessx.php"
license=('GPL')
source=("$pkgname-$_intpkgver.patch" "$pkgname-$_intpkgver-lX11.patch" "http://cita.disability.uiuc.edu/software/accessx/files/$pkgname$_intpkgver.tar.gz")
md5sums=('43b4e0a52d4512147ae26b9314d603cb'
         '3fffa9843b34e8fd2b0f610336700552'
         'e61286559b65e452705a6329646776f1')
build() {
  cd $srcdir/$pkgname
  patch -Np1 -i ../$pkgname-$_intpkgver.patch
  patch -Np1 -i ../$pkgname-$_intpkgver-lX11.patch
  make || return 1
  install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname" || return 1
  install -Dm755 "$srcdir/$pkgname/ax" "$pkgdir/usr/bin/ax" || return 1
}
