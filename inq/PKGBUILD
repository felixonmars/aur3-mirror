# Contributor: Frane Bandov <frane@offbyte.com>
pkgname=inq
pkgver=1.0.0
pkgrel=2
pkgdesc="Inq is a graphical front-end for libinklevel."
url="http://www.fioreltech.net/project/inq/start"
license=('GPL')
depends=('qt' 'libinklevel')
arch=('i686' 'x86_64')
source=(http://www.fioreltech.net/_media/project/inq/version-1.0.0/inq-1.0.0.tar.gz)
md5sums=(b82d1f29773eb60d9a336631df1289cc)
build() {
  cp $srcdir/installrules $srcdir/$pkgname-$pkgver
  cp $srcdir/inq.desktop $srcdir/$pkgname-$pkgver
  cd $srcdir/$pkgname-$pkgver
  
  ./configure
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
