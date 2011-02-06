# Contributor: Philipp Robbel <robbel@gmail.com>

pkgname=setv4l
pkgver=0.3
pkgrel=1
pkgdesc="A simple command line program for changing the picture settings of a video 4 linux device"
arch=(i686 x86_64)
url="http://members.chello.nl/~j.vreeken/setv4l/"
license=('GPL')
depends=('glibc')
source=(http://members.chello.nl/~j.vreeken/setv4l/$pkgname-$pkgver.tar.gz Makefile.patch)
md5sums=('95f02fe04766879f99e2a434b4558aaf' 'd23254c67d25c0a8715a4f80d1310d21')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch Makefile $startdir/src/Makefile.patch
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  install -m755 $startdir/src/$pkgname-$pkgver/$pkgname $startdir/pkg/usr/bin
}
