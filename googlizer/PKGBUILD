# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: crocowhile <giorgio gilest ro>

pkgname=googlizer
pkgver=2
pkgrel=1
pkgdesc="A GNOME panel/menu launcher that spawns a Google search of your X clipboard contents"
arch=('i686' 'x86_64')
url="http://www.linux.org.uk/~telsa/BitsAndPieces/googlizer.html"
license=('GPL')
depends=('libgnomeui')
source=(ftp://ftp.linux.org.uk/pub/linux/alan/Software/Gnome/Googlizer/$pkgname.tar.gz
        $pkgname-$pkgver.diff)
md5sums=('63f59e073ee6c8b080a52c4efc43cb99'
         '967d8d4ffd92a37a174466340c440414')

build() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i ../$pkgname-$pkgver.diff
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
