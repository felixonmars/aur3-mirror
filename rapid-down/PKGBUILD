pkgname=rapid-down
pkgver=0.5.0
pkgrel=1
pkgdesc="Rapidshare Downloader is a simple application that allows you to download your files from Rapidshare.com"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rapid-down/"
license=('GPL')
depends=('qt>=4' 'wget')
makedepends=('make')
source=(http://rapid-down.googlecode.com/files/rapid-down-$pkgver.tar.gz)

md5sums=('9563877da9c2b2c6b69f273a8a216d5e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake || return 1
  make || return 1

  local prefix=${pkgdir}/usr/bin
  install -D -m 0655 ./rapid-down ${prefix}/rapid-down

  local prefix=${pkgdir}/usr/share/applications
  install -D -m 0644 ./data/rapid-down.desktop ${prefix}/rapid-down.desktop

  local prefix=${pkgdir}/usr/share/pixmaps
  install -D -m 0644 ./data/rapid-down.png ${prefix}/rapid-down.png
}