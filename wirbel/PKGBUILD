# Maintainer:  TDY <tdy@gmx.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=wirbel
pkgver=0.1.11
pkgrel=2
pkgdesc="A compiler language with similar syntax and semantics to Python"
arch=('i686' 'x86_64')
url="http://mathias-kettner.de/wirbel.html"
license=('GPL')
depends=('glibc')
optdepends=('python: for documentation benchmarks')
source=(http://mathias-kettner.de/download/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver.diff)
md5sums=('7c1a82501cddb5707d6788b280194bd7'
         '7b7999cbcefdf54c3afb15e52a14612b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver.diff || return 1
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
