# Maintainer: Jens Staal <staal1978@gmail.com>
# contributor: almehdi

pkgname=fribid-git
pkgver=20141102
pkgrel=1
pkgdesc="A Free re-implementation of the Swedish BankID/eID system"
arch=('i686' 'x86_64')
url="http://fribid.se/"
license=('custom')
depends=('gettext' 'glib2' 'gtk2' 'openssl' 'opensc' 'libp11' )
optdepends=('openct: smartcard support')
makedepends=('git')
provides=('nexuspersonal')
conflicts=('nexuspersonal' 'fribid-stable')
source=("$pkgname"::'git+git://git.fribid.se/fribid')
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd  "$srcdir/$pkgname"
  ./configure --prefix=/usr --pkcs11-module=/usr/lib/pkcs11/opensc-pkcs11.so
  make
}

package() {
  cd  "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/fribid/LICENSE"
}