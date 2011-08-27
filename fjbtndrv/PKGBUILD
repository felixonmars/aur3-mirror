# Contributor: Bryan Fisher <fisherbryn@gmail.com> 

pkgname=fjbtndrv
pkgver=2.1.2
pkgrel=2
pkgdesc="Linux driver for the tablet buttons of Fujitsu Siements Tablet PCs (Lifebooks P-, T-, and U-Series, Sylistic T and ST5xxx)"
arch=('i686')
makedepends=('kernel26-headers')
optdepends=('xosd')
url="http://sourceforge.net/projects/fjbtndrv/"
license=('GPL')
install=('fjbtndrv.install')
source=(http://softlayer.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f36634071e360ca992532490315c663e')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix="/usr"\

  make || return 1
  make DESTDIR=$pkgdir install

  #install the kernel module
  install -D -m 644 "$srcdir/$pkgname-$pkgver/src/linux/fsc_btns.ko" "$pkgdir/lib/modules/$(uname -r)/drivers/input/fsc_btns.ko"

  #rm -rf "$pkgdir/home"
}
