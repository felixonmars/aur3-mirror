# Maintainer: eagletmt <eagletmt@gmail.com>
pkgname=mecab-ruby
pkgver=0.993
pkgrel=1
pkgdesc='Yet Another Japanese Dependency Structure Analyzer - Ruby interface'
arch=('i686' 'x86_64')
url='http://code.google.com/p/mecab/'
depends=('ruby' 'mecab')
license=('BSD' 'LGPL' 'GPL')
source=("http://mecab.googlecode.com/files/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ruby extconf.rb
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -D -m644 BSD "$pkgdir/usr/share/licenses/$pkgname/BSD"
  install -D -m644 LGPL "$pkgdir/usr/share/licenses/$pkgname/LGPL"
  install -D -m644 GPL "$pkgdir/usr/share/licenses/$pkgname/GPL"
}

# vim: set ft=sh ts=2 sw=2:
md5sums=('e7347fefa289abd71b00a43d00a6f98e')
