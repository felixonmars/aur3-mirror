pkgname=linabx
pkgver=1.99.8
pkgrel=1
pkgdesc="Double-blind audio testing (ABX) application with a GNOME based GUI."
url="http://beryllium.net/~remco/linabx/"
license="GPL"
depends=('jack-audio-connection-kit>=0.100' 'libsndfile' 'libsamplerate' 'libgnomeui>=2.10 gconf')
source=(http://beryllium.net/~remco/linabx/$pkgname-$pkgver.tar.gz )
md5sums=(fb2ac3c90fc71f83402c515fae3db373)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
