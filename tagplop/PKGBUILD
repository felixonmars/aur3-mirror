# Maintainer: TDY <tdy@gmx.com>

pkgname=tagplop
pkgver=0.0.3.1
pkgrel=2
pkgdesc="A simple music file tagger"
arch=('i686' 'x86_64')
url="http://tagplop.googlecode.com/"
license=('GPL')
depends=('libglade' 'tunepimp')
makedepends=('pkgconfig')
source=(http://$pkgname.googlecode.com/files/${pkgname}_$pkgver.tar.bz2
        $pkgname-$pkgver.diff)
md5sums=('6fcde2826208757ca3ef047bb0de2e8c'
         'd71ae424ad9ad22ecd117e890f236351')

build() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i ../$pkgname-$pkgver.diff || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
