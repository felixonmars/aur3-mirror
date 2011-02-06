# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Callan Barrett <wizzomafizzo@gmail.com>
# Contributor: stenico
# Contributor: Erus_Iluvatar <erus.iluvatar@gmail.com>

pkgname=tmsnc
pkgver=0.3.3
pkgrel=1
pkgdesc="A text based MSN Messenger client"
arch=('i686' 'x86_64')
url="http://tmsnc.sourceforge.net"
license=('custom:IRPDL')
depends=('ncurses' 'openssl')
#source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
_pkg="$pkgname-$pkgver-Testing"
if [ "$CARCH" = "i686" ]; then
  _pkgurl="${_pkg}-i686"
  source=(http://downloads.sourceforge.net/$pkgname/${_pkgurl}.tar.gz)
  md5sums=('a6194de32de3fb968c6a27f1045ac940')
elif [ "$CARCH" = "x86_64" ]; then
  _pkgurl="${_pkg}-x86-64"
  source=(http://downloads.sourceforge.net/$pkgname/${_pkgurl}.tar.gz)
  md5sums=('b980f5b337da8f5c461713a5c758dbe5')
fi

build() {
  cd "$srcdir/${_pkg}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkg}"
  make DESTDIR="$pkgdir" install

  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
