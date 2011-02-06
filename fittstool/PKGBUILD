# Contributor: jwwolf <jwwolf+arch@gmail.com>
pkgname=fittstool
pkgver=0.1
pkgrel=1
pkgdesc="A tool for binding mouse button events on the screen corners in X to commands."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fittstool/"
sourceurl="http://fittstool.googlecode.com/files/"
license=('GPLv2')
depends=(libxcb glib2)

source=($sourceurl$pkgname-$pkgver.tar.gz)
md5sums=('985570a1ec0dfd1ada0166e909237130')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
