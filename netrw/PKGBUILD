# Contributor:  <ndowens04@gmail.com>
pkgname=netrw
pkgver=1.3.2
pkgrel=1
pkgdesc="netrw is a simple (but powerful) tool for transporting data over the internet. Its main purpose is to simplify and speed up file transfers to hosts without an FTP server."
arch=('i686')
url="http://mamuti.net/netrw/index.en.html"
license=('GPL')
source=(http://mamuti.net/files/netrw/$pkgname-$pkgver.tar.bz2)
md5sums=('13715dfe915ee77319da938a8ac99ae7')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$pkgdir/usr install
}
