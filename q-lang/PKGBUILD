# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=q-lang
pkgver=7.11
pkgrel=3
pkgdesc="A functional programming language based on term rewriting"
arch=('i686')
url="http://q-lang.sf.net"
license=('GPL')
depends=('unixodbc' 'gmp' 'libxslt' 'curl' 'gdbm')
source=(http://downloads.sourceforge.net/$pkgname/q-$pkgver.tar.gz)
provides=('q')
replaces=('q')
install=q-lang.install
options=('docs')
md5sums=('18ca956aad555b54efacc0de5b2d79bd')

build() {
  cd $srcdir/q-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  # Remove empty example folders and "dir" file
  rm -rf $pkgdir/usr/share/q/examples/ || return 1
  rm $pkgdir/usr/share/info/dir || return 1
}
