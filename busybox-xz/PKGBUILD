# Maintainer: Daniel Beecham <daniel@lunix.se>
# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: nbvcxz <nbvxz@o2.pl>

pkgname="busybox-xz"
pkgver="5.0.4"
pkgrel=1
pkgdesc="Replaces xz binaries with corresponding commands from Busybox."
arch=('i686', 'x86_64')
url="http://busybox.net"
provides=("xz=$pkgver")
conflicts=('xz')
license=('GPLv2')
depends=('busybox')
source=("ftp://ftp.archlinux.org/core/os/$CARCH/xz-$pkgver-$pkgrel-$CARCH.pkg.tar.xz" "missing")
echo $source
#http://ftp.archlinux.org/core/os/x86_64/xz-5.0.4-1-x86_64.pkg.tar.xz

if test $CARCH == "x86_64"; then
    sha256sums=('050e3769f975747dbb25342cdc018389fc6c5f6059b9e11952820fded2babe62' 'a043abe59db43172bf7910d441874dcc5a425adab0278754a24d2aa5fcb219c4')
else
    sha256sums=('d0feb33db2d5be1b61270b8f738382924df78b5ed34aa34a2e18a22c974fa4f7' 'a043abe59db43172bf7910d441874dcc5a425adab0278754a24d2aa5fcb219c4')
fi

_missing=($srcdir/missing)

build() {

  msg "creating package directories"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"

  msg "creating symlinks for /usr/bin"
  cd $pkgdir/usr/bin
  ln -s /bin/busybox lzcat
  ln -s /bin/busybox lzma
  ln -s /bin/busybox unzlma
  ln -s /bin/busybox xzcat
  ln -s /bin/busybox xz
  ln -s /bin/busybox unxz

  msg "copying missing xz libraries"
  cp -pR $srcdir/usr/include $pkgdir/usr/include
  cp -pR $srcdir/usr/lib $pkgdir/usr/lib

  warning "This package is missing binaries from the xz package which might be"
  warning "important. Here is a list of what is missing:"
  warning "$(cat $_missing)"


}
