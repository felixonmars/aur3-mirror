pkgname=ruby-bdb
pkgver=0.6.6
pkgrel=1
pkgdesc="Ruby interface to Berkeley DB"
arch=('i686' 'x86_64')
url="http://raa.ruby-lang.org/project/bdb"
license=('Ruby')
depends=('ruby')
source=("http://ftp.riken.go.jp/pub/FreeBSD/distfiles/ruby/bdb-$pkgver.tar.bz2")
md5sums=('2f782d729c8bab571a6b9867f7280d16')

build() {
  cd "$srcdir/bdb-$pkgver"

  ruby extconf.rb
  make
}

package() {
  cd "$srcdir/bdb-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -d -m 755 "$pkgdir/usr/share/doc/$pkgname/"
  install -m 644 README.en "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
