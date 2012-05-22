# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=shinonome-font
pkgver=0.9.11
pkgrel=1
pkgdesc="various 12,14,16 dot Japanese Kanji, iso8859-1 fonts for X11"
arch=('any')
url="http://openlab.ring.gr.jp/efont/shinonome/"
license=('custom:PD')
depends=('xorg-mkfontdir' 'xorg-bdftopcf')
install=shinonome-font.install
source=("http://openlab.ring.gr.jp/efont/dist/shinonome/shinonome-0.9.11p1.tar.bz2")
md5sums=('5fb94de9a9971ac67a4d53d62f77bc1d')

build() {
  cd "$srcdir/shinonome-$pkgver"
  ./configure --with-pcf --without-bdf --enable-compress=gzip \
              --with-fontdir="$pkgdir/usr/share/fonts/local"
  make
}

package() {
  cd "$srcdir/shinonome-$pkgver"
  make install
  rm "$pkgdir/usr/share/fonts/local/fonts.dir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
