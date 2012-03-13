# Maintainer: ianux <ianux at free dot fr>
# Contributor: priyank

pkgname=ices
pkgver=0.4
pkgrel=3
pkgdesc="source client for broadcasting in mp3 to an Icecast2 server"
arch=('i686' 'x86_64')
license=('GPL')
url="http://icecast.org/ices.php"
depends=('libxml2' 'lame' 'libvorbis' 'libshout' 'python2' 'perl')
source=(http://downloads.us.xiph.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d31450c4011561dae0229f071cb41cb6')
options=('!docs')
install=$pkgname.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/usr/share/$pkgname -mandir=/usr/share \
    --with-python=/usr/bin/python2 --without-faad --without-flac
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  # Rename files to avoid conflict with ices2
  mv "$pkgdir/usr/bin/ices" "$pkgdir/usr/bin/ices0"
  mv "$pkgdir/usr/share/ices" "$pkgdir/usr/share/ices0"
}
