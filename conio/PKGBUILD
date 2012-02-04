# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=conio
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="borland conio for linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/conioforlinux/files/conio-0.1.0/"
license=('GPL')
groups=()
depends=('ncurses')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(http://sourceforge.net/projects/conioforlinux/files/conio-0.1.0/$pkgname-$pkgver.tar.gz/download)
noextract=()
md5sums=(b39c59ddffd9c99b9f5657dceafc583e) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname"
  make -k check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
