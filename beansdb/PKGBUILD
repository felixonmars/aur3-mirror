# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=beansdb
pkgver=0.3.0
pkgrel=1
pkgdesc="Yet anonther distributed key-value storage system from Douban Inc."
arch=(i686)
url="http://code.google.com/p/beansdb/"
license=('BSD')
groups=()
depends=('tokyocabinet>1.4')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://beansdb.googlecode.com/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('ff55f36753123578098ce16b0fd7d627')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  mv -v $pkgdir/usr/bin/convert  $pkgdir/usr/bin/beansdb-convert
}

# vim:set ts=2 sw=2 et:
