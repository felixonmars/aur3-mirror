# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Maintainer: David Lazar <lazar6 at illinois edu>

# Contribute changes: https://github.com/davidlazar/aur

pkgname=hugs98
pkgver=200609
pkgrel=5
pkgdesc="Haskell 98 interpreter"
arch=('i686' 'x86_64')
url="http://www.haskell.org/hugs"
license=('custom:BSD3')
depends=('readline>=6.0' 'sh')
source=(http://www.haskell.org/hugs/downloads/2006-09/hugs98-plus-Sep2006.tar.gz)
sha256sums=('aafaca9ca544572ebef70bbe86b5eb0abaa5d7c11c0b766d7db72a46b022bed5')

build() {
  cd "$srcdir/$pkgname-plus-Sep2006"
  ./configure --prefix=/usr --with-pthreads
  make
}

package() {
  cd "$srcdir/$pkgname-plus-Sep2006"
  make DESTDIR="$pkgdir" install

  install -Dm644 License "$pkgdir"/usr/share/licenses/hugs98/license
}
