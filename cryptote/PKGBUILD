# Contributor: Robert Orzanna <orschiro@googlemail.com>

pkgname=cryptote
pkgver=0.5.390
pkgrel=2
pkgdesc="CryptoTE is a text editor with integrated strong cryptography, based on the scintilla widget."
arch=('x86_64' 'i686')
license=('GPL')
url="http://idlebox.net/2009/cryptote/"
depends=('wxgtk') 
source=(http://idlebox.net/2009/cryptote/$pkgname-$pkgver.tar.bz2)
md5sums=('7cf773e3033e8477dd27a8384d7b065d')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -d $startdir/pkg/usr/share/$pkgname
}
