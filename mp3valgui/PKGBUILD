# Maintainer: TDY <tdy@gmx.com>

pkgname=mp3valgui
pkgver=0.1.1
pkgrel=3
pkgdesc="A PyGTK interface to mp3val"
url="http://mp3val.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mp3val' 'pygtk')
source=(http://downloads.sourceforge.net/mp3val/$pkgname-$pkgver.zip
        $pkgname-$pkgver-$pkgrel.diff)
md5sums=('8590c146ff5daf3754720edaef3845e4'
         '5aeabca5db7193fa9ba6b8790beb6a31')

build() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i ../$pkgname-$pkgver-$pkgrel.diff
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
