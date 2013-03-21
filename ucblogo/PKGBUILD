# Contributor: chiku <chirantan DOT mitra AT gmail DOT com>

pkgname=ucblogo
pkgver=6.0
pkgrel=4
pkgdesc='Portable semi-canonical dialect of Logo programming language'
url='http://www.cs.berkeley.edu/~bh/logo.html'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libx11' 'ncurses')
makedepends=()
_md5sum="36a56765b18136c817880c5381af196b"
source=("http://pkgs.fedoraproject.org/repo/pkgs/$pkgname/$pkgname-$pkgver.tar.gz/$_md5sum/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver-no-wxWidgets.patch"
        "$pkgname-$pkgver-no-texinfo.patch"
        "logo")
md5sums=($_md5sum
         baf2444dbf85ced65c67a11634401907
         13d5c416d1099e73bb224a45ca41ac9e
         640b7d4872639da0071b2b5f5058d99a)

build() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/$pkgname-$pkgver-no-wxWidgets.patch" || return 1
  patch -Np1 -i "$srcdir/$pkgname-$pkgver-no-texinfo.patch" || return 1
  make ${MAKEFLAGS} || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # csls/CVS interferes with make
  rm -rf "$srcdir/$pkgname-$pkgver/csls/CVS"
  make prefix="$pkgdir/usr" INFODIR="$pkgdir/usr/share/info" install || return 1
  mv "$pkgdir/usr/bin/logo" "$pkgdir/usr/bin/logo.real"
  cp "$srcdir/logo" "$pkgdir/usr/bin/logo"
}
