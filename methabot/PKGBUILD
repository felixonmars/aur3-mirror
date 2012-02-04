
# Contributor: Your Name <youremail@domain.com>
pkgname=methabot
pkgver=1.6.0.1
pkgrel=1
pkgdesc="A scriptable multi-purpose ftp- and web crawler with an extensible configuration system and speed-optimized architectural design."
arch=('i686')
url="http://bithack.se/projects/methabot/"
license=('custom')
depends=('spidermonkey' 'curl' )
source=(http://downloads.sourceforge.net/methabot/$pkgname-$pkgver.tar.gz)
md5sums=('24f64a9b7069d202df3550c49c89ec90') 

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install

install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING

}


