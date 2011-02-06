# Contributor: fnord0 < fnord0 AT riseup DOT net >

pkgname=curses-hexedit
pkgver=0.9.7
pkgrel=1
pkgdesc=('[N]Curses Hexedit is a full screen hex editor using the curses, ncurses, or pdcurses library')
arch=('i686' 'x86_64')
url=("http://www.rogoyski.com/adam/programs/hexedit/")
license=('GPL')
depends=('ncurses')
optdepends=('pdcurses: cross-platform curses implementation')
source=("http://www.rogoyski.com/adam/programs/hexedit/hexedit-$pkgver.tar.gz")
md5sums=("2658b81ab1bd0813c0117e9459071c13")
sha1sums=("642abf8c966d1ad3e82b3ff0e1abd3c342d44b7f")

build() {
  cd ${srcdir}/hexedit-$pkgver

  ./configure --prefix=/usr --infodir=/usr/share/info || return 1
  make || return 1
}

package() {
  cd ${srcdir}/hexedit-$pkgver
  make DESTDIR="$pkgdir/" install || return 1
}
# vim:syntax=sh
