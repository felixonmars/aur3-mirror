# Maintainer: David Manouchehri <david@davidmanouchehri.com>

pkgname=pic32prog-git
_gitname=$(printf ${pkgname%%-git})
_gitbranch=master
_gitauthor=sergev
pkgver=r118.c08fdb9
pkgrel=1
pkgdesc="Flash programming utility for Microchip PIC32 microcontrollers"
url="https://github.com/$_gitauthor/$_gitname"
license=('GPL2')
source=("git://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch")
validpgpkeys=('F0FE029614EA35BC9E4F9768A6ECFD0C40839755') # David Manouchehri
sha512sums=('SKIP')
arch=('i686' 'x86_64')
makedepends=('git')
optdepends=('ejtagproxy-git: GDB for PIC32' 
            'microchip-mplabxc32-bin: C/C++ compiler for PIC32')
conflicts=("$_gitname")
provides=("$_gitname")
replaces=("$_gitname-svn")

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cp "$srcdir/$_gitname/pic32prog" "$pkgdir/usr/local/bin/"
}
