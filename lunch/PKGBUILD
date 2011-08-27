# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=lunch
pkgver=0.4.0
pkgrel=1
pkgdesc="A distributed process launcher and manager for GNU/Linux"
arch=('any')
url="http://tarballs.quessy.net/"
license=('GPL')
depends=('python2')
makedepends=('help2man' 'epydoc>=3.0.1')
install="$pkgname.install"
source=($url$pkgname-$pkgver.tar.gz)
md5sums=('df7c502b227e9d862d4b8d7449277233')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fixes
  sed -i "s|env python|&2|g" `grep -Erl "env python" .`

  # Makefile fixes
  sed -e "s|python|&2|g;s|/local||g;s|prefix.*|& --root=$pkgdir|" \
      -e "s|/usr/|$pkgdir&|g;s|\tinstall|& -Dm644|g;s|ns/|&lunch.desktop|" \
      -i Makefile

  make html
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Install doc and examples
  install -d "$pkgdir/usr/share/"{doc/,}$pkgname
  cp -a *html* "$pkgdir/usr/share/doc/$pkgname"
  cp -a examples "$pkgdir/usr/share/$pkgname"
}

# vim:set ts=2 sw=2 et:
