# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname=ctemplate
pkgver=2.3
pkgrel=1
pkgdesc="A library implementing a simple but powerful template language for C++"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ctemplate/"
license=('BSD')
makedepends=('subversion' 'python2')
depends=('gcc-libs' 'perl')
source=(svn+http://$pkgname.googlecode.com/svn/tags/$pkgname-$pkgver/
        python2.patch)
sha256sums=('SKIP'
            '51287e5043aaf8ea87dcf3f824ec8b92dceeafc74552abf32a447b38c3b12f13')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < "$srcdir/python2.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
