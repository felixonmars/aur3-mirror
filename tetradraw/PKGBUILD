# Maintainer: Clayton G. Hobbs <clay@lakeserv.net>
pkgname=tetradraw
pkgver=2.0.2
pkgrel=2
pkgdesc="Tetradraw is a fully featured ANSI art editor for *nix operating systems"
arch=('i686' 'x86_64')
url="http://tetradraw.sourceforge.net/"
license=('GPL')
depends=('ncurses')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz http://tetradraw.sourceforge.net/docs.html)
md5sums=('a01315812472dbda419ced1c4f7be525'
         '76eaa0f9b93825e5ae9dbe3a07a64bd1') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 docs.html "${pkgdir}/usr/share/doc/${pkgname}/"

  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
