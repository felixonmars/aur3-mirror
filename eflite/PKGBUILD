# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=eflite
pkgver=0.4.1
pkgrel=2
pkgdesc="a speech server for Emacspeak and other screen readers forFestival Lite"
arch=('i686')
url="http://eflite.sourceforge.net/"
license=('GPL')
depends=('alsa-lib')
makedepends=('flite')
source=(http://downloads.sourceforge.net/eflite/$pkgname-$pkgver.tar.gz
        fix-makefile.patch)
md5sums=('9c1a25990426ae1c6519ee1a4528dc03'
         'b6a5af8206d99c481fb0e8cffb7e1652')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < "$srcdir/fix-makefile.patch"
  ./configure --prefix="$pkgdir/usr" --with-vox=cmu_us_kal16
  make
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
